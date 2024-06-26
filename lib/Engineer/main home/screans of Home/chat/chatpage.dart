import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

class chat1 extends StatefulWidget {
  final String currentUser;
  final String otherUser;

  chat1({required this.currentUser, required this.otherUser});

  @override
  State<chat1> createState() => _chat1State();
}

class _chat1State extends State<chat1> {
  final _controler = ScrollController();

  List<String> messages = [];

  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: appbar(),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _controler,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return chatbubble(
                    mssage: messages[index],
                  );
                },
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(top: 16, right: 3, left: 3, bottom: 16),
              child: Row(
                children: [
                  Transform.rotate(
                      angle: 120 * math.pi / 180,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.attachment_rounded, size: 25),
                      )),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      // onSubmitted: (data) {
                      //   messages.add({
                      //     'messege': data,
                      //   });
                      //   _messageController.clear();
                      // },
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(239, 245, 245, 1.0),
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigo.shade900),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _sendMessage();
                            },
                            icon: Icon(Icons.send),
                            color: Colors.indigo.shade900),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                            BorderSide(color: Colors.indigo.shade900)),
                        hintText: 'Type a message...',
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(
                  //       Icons.mic_none_outlined,
                  //       size: 28,
                  //     )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() async {
    final message = _messageController.text;

    // TODO: Replace with your API endpoint
    final apiUrl = 'https://your-api-endpoint.com/send-message'; //غير صحيح Api

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'message': message},
        // TODO: Include authentication token in headers
        headers: {'Authorization': 'Bearer yourAuthToken'},
      );

      if (response.statusCode == 200) {
        // Message sent successfully, update UI or perform other actions
        setState(() {
          messages.add(message);
          _messageController.clear();
          _controler.animateTo(
            _controler.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
          );
        });
      } else {
        // Handle errors
        print('Failed to send message. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors
      print('Error sending message: $e');
    }
  }
}

////////
class chatbubble extends StatelessWidget {
  const chatbubble({super.key, required this.mssage});

  final mssage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(15),
        child:
        Text(mssage, style: TextStyle(fontSize: 15, color: Colors.white)),
        decoration: BoxDecoration(
            color: Colors.indigo[700],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
                topLeft: Radius.circular(16))),
      ),
    );
  }
}

/////دي كنت عاملها عشان تظبط زاويه icon
// Transform.rotate(
// angle: 120 * math.pi / 180,
// child: IconButton(
// onPressed: () {},
// icon: Icon(Icons.attachment_rounded, size: 25),
// )),


Widget appbar() {
  return row_in_appbarchat();
}

class row_in_appbarchat extends StatelessWidget {
  const row_in_appbarchat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp, color: Colors.black),
        ),
        CircleAvatar(
          radius: 50,
          child: Image.asset("assets/Ellipse 2.png"),
        ),
        Text("kareem"),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}