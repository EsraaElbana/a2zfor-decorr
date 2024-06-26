


import 'package:clint_store/client_screens/home_screen_cl/home.dart';
import 'package:clint_store/interduce_pages/choose_client_or_engineer.dart';
import 'package:clint_store/services/shared_preference.dart';
import 'package:clint_store/utilities/routes_manager.dart';
import '../../contact us/countactus_form.dart';
import '../profile _screen_user/profile_screen.dart';
import 'package:flutter/material.dart';

class CreatDrawerClient extends StatelessWidget {
  const CreatDrawerClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Define your end drawer content here
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      height: 100,
                      width: 100,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 24,
                          color: const Color(0xFF191C55),
                        )),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreenClient(),
                            ));
                        // Handle the Home tap
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('Profile'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ));
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text('Messages'),
                      onTap: () {
                        // Handle the Settings tap
                      },
                    ),
                    ExpansionTile(
                      backgroundColor: Colors.white70,
                      collapsedTextColor: const Color(0xFF191C55),
                      textColor: const Color(0xFFC58A00),
                      iconColor: const Color(0xFFC58A00),
                      collapsedIconColor: const Color(0xFF191C55),
                      title: Text("Help"),
                      childrenPadding: EdgeInsets.only(left: 40),
                      //children padding
                      children: [
                        ListTile(
                          title: Text("Contact Us"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ContactUs(),
                                ));
                            //action on press
                          },
                        ),

                        //more child menu
                      ],
                    ),
                    ExpansionTile(
                      backgroundColor: Colors.white70,
                      collapsedTextColor: const Color(0xFF191C55),
                      textColor: const Color(0xFFC58A00),
                      iconColor: const Color(0xFFC58A00),
                      collapsedIconColor: const Color(0xFF191C55),
                      title: Text("Setting"),
                      childrenPadding: EdgeInsets.only(left: 40),
                      //children padding
                      children: [
                        ListTile(
                          leading: Icon(Icons.person_outline_sharp),
                          title: Text("My Account"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileScreen(),
                                ));

                            //action on press
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.translate),
                          title: ExpansionTile(
                            backgroundColor: Colors.white70,
                            collapsedTextColor: const Color(0xFF191C55),
                            textColor: const Color(0xFFC58A00),
                            iconColor: const Color(0xFFC58A00),
                            collapsedIconColor: const Color(0xFF191C55),
                            title: Text("Language"),
                            childrenPadding: EdgeInsets.only(left: 40),
                            //children padding
                            children: [
                              ListTile(
                                title: Text("English"),
                                onTap: () {
                                  //action on press
                                },
                              ),

                              //more child menu
                            ],
                          ),
                          onTap: () {
                            //action on press
                          },
                        ),

                        // ListTile(
                        //
                        //   title: Text("Currency"),
                        //   leading: Icon(Icons.currency_exchange),
                        //   onTap: () {
                        //     //action on press
                        //   },
                        // ),

                        //more child menu
                      ],
                    ),
                    ExpansionTile(
                      backgroundColor: Colors.white70,
                      collapsedTextColor: const Color(0xFF191C55),
                      textColor: const Color(0xFFC58A00),
                      iconColor: const Color(0xFFC58A00),
                      collapsedIconColor: const Color(0xFF191C55),
                      title: Text("About Us"),
                      childrenPadding: EdgeInsets.only(left: 40),
                      //children padding
                      children: [
                        ListTile(
                          title: Text("GO TO landing page"),
                          onTap: () {
                            //action on press
                          },
                        ),

                        //more child menu
                      ],
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                      onTap: () {
                        // Handle the Logout tap


                        SharedPreference.clear();
                        RoutesManager.navigatorAndRemove(context, ChooseClientOrEngineer());
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
