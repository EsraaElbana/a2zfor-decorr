import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class commentpage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: 15, // The number of chat items
                itemBuilder: (context, index) {
                  return ListTile(
                    // itemBuilder:
                    // itemCount: imageUrls.length,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        imageUrls[index],
                      ),
                    ),
                    title: Text('Contact Name',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Recent message preview'
                        'good design '),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('clients',
                            style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ])),
    );
  }
}
