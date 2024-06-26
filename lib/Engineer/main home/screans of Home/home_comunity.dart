import 'package:flutter/material.dart';

import '../../comments.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final List<String> imageUrls = [
    "assets/images/p10.png",
    "assets/images/p11.png",
    "assets/images/p12.png",
    "assets/images/p13.png",
    "assets/images/p14.png",
    "assets/images/p15.png",
    "assets/images/p16.png",
    "assets/images/p17.png",
    "assets/images/p18.png",
    "assets/images/p15.png",
    "assets/images/p17.png",
    "assets/images/p10.png",
    "assets/images/p14.png",
    "assets/images/p15.png",
    "assets/images/p17.png",
    "assets/images/p10.png",
    "assets/images/p18.png",

  ];

  final List<String> postimage = [
    "assets/images/e1 (4).png",
    "assets/images/e1 (2).png",
    "assets/images/e1 (3).png",
    "assets/images/e1 (4).png",
    "assets/images/e1 (5).png",
    "assets/images/e1 (3).png",
    "assets/images/e1 (3).png",
    "assets/images/e1 (4).png",
    "assets/images/e1 (1).png",
    "assets/images/e1 (3).png",
    "assets/images/e1 (5).png",
    "assets/images/e1 (2).png",
    "assets/images/e1 (3).png",
    "assets/images/e1 (4).png",

  ];

  String searchQuery = '';

  String username = "name";

  bool icon = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  searchQuery = value;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                      width: 0,
                    ),
                  ),
                  hintText: 'Search ....',
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.grey),
                    onPressed: () async {
                      // Implement search functionality
                      //    List<String> searchResults = await searchUsers(searchQuery);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemCount:postimage.length ,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Home(),
                        //     ));
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Image.asset(imageUrls[index]),
                                // ImageIcon(
                                //   AssetImage("assets/Ellipse 2.png"),
                                //),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("$username"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    " Handle window ActivityRecord  have a 100-meter apartment that needs to be finished"
                                    "two rooms, a hall, a bathroottm, and a kitchen"
                                    "I want to write it off within 100,000."),
                              ),
                              Container(
                                child: Image.asset(postimage[index],
                                    fit: BoxFit.cover),
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        icon = !icon;
                                      });
                                    },
                                    icon: Icon(
                                        icon
                                            ? (Icons.thumb_up_alt_outlined)
                                            : Icons.thumb_up,
                                        color: Colors.indigo.shade900),
                                    style: ButtonStyle(
                                        iconSize: MaterialStatePropertyAll(35)),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text("Like"),
                                ],
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => commentpage(),));
                                    },
                                    icon: Icon(Icons.mode_comment_outlined),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text("comment")
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
