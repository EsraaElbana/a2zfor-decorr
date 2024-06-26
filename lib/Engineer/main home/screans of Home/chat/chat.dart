import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;

import 'chatpage.dart';





class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button
          },
        ),
        title: Text('chat', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                placeholder: 'search....',
              ),
            ),
            Expanded(
              child: ListView.builder(
                //itemCount: 10, // The number of chat items
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                chat1(currentUser: "", otherUser: "otherUser"),
                          ));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        // Placeholder for avatar image
                        backgroundImage: AssetImage("assets/Ellipse 2.png"),
                        // NetworkImage(''),
                        // child: Container(
                        //   width: 10,
                        //   height: 10,
                        //   decoration: BoxDecoration(
                        //     color: Colors.green,
                        //     shape: BoxShape.circle,
                        //   ),
                        // ),
                      ),
                      title: Text('Contact Name',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Recent message preview'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('timestamp',
                              style:
                              TextStyle(fontSize: 13, color: Colors.grey)),
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text('3',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}