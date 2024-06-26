import 'package:flutter/material.dart';
class settingProfileEngineer extends StatelessWidget {
  settingProfileEngineer({super.key});

  final List<String> item1 = [
    'Edit profile',
    'security',
    ' Privacy',
  ];
  final List<String> item2 = [
    'My Subscription',
    'Help & Support',
    ' Terms and Policies',
  ];
  final List<String> item3 = [
    'Report a problem',
    'Add account',
    ' Log out',
  ];
  final List<String> image1 = [
    "assets/images/iconamoon_profile-light.png",
    "assets/images/Vector (1).png",
    "assets/images/ic_outline-lock.png"
  ];
  final List<String> image2 = [
    "assets/images/iconamoon_profile-light.png",
    "assets/images/iconamoon_profile-light.png",
    "assets/images/tabler_circle-letter-i.png"
  ];
  final List<String> image3 = [
    "assets/images/flag.png",
    "assets/images/s1.png",
    "assets/images/mdi_logout.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          "Setting",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 19),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 160, // Set a fixed height, for example
            margin: EdgeInsets.only(bottom: 16.0, left: 16, right: 16, top: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(
                color: Colors.white60,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: item1.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {

                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ImageIcon(AssetImage(image1[index])),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            item1[index],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Support & About",
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
          Container(
            height: 150, // Set a fixed height, for example
            margin: EdgeInsets.only(bottom: 16.0, left: 16, right: 16, top: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(
                color: Colors.white60,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: item2.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ImageIcon(AssetImage(image2[index])),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            item2[index],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Acctions",
                  style: TextStyle(fontSize: 19),
                ),
              ],
            ),
          ),
          Container(
            height: 150, // Set a fixed height, for example
            margin: EdgeInsets.only(bottom: 16.0, left: 16, right: 16, top: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(
                color: Colors.white60,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: item3.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(15),
                  child: InkWell(
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ImageIcon(AssetImage(image3[index])),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            item3[index],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
