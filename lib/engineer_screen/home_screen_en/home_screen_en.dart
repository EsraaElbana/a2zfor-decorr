import 'package:clint_store/Drawer/drawer_Engineer.dart';
import 'package:clint_store/cubit/application_state/engineer_states.dart';
import 'package:clint_store/cubit/cubits/engineer_cubit.dart';
import 'package:clint_store/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Engineer/main home/screans of Home/chat/chat.dart';
import '../../Engineer/main home/screans of Home/home_comunity.dart';
import '../../Engineer/main home/screans of Home/post_profile_pic_eng.dart';
import '../../Engineer/main home/screans of Home/posts/new post.dart';
import '../../Engineer/main home/screans of Home/profile/profile.dart';
import '../../app_manager/local_data.dart';
import '../../common_widget/create_toast.dart';

import '../../services/shared_preference.dart';

class HomeScreenEngineer extends StatefulWidget {
  const HomeScreenEngineer({super.key});

  @override
  State<HomeScreenEngineer> createState() => _HomeScreenEngineerState();
}

class _HomeScreenEngineerState extends State<HomeScreenEngineer> {
  @override
  void initState() {
    print("user address  : ${SharedPreference.getData(key: "userAddress")}");
    print("user phone  : ${SharedPreference.getData(key: "userNumber")}");
    print("user email  : ${SharedPreference.getData(key: "email")}");

    print("user Id : ${SharedPreference.getData(key: "userId")}");
    print("user token : ${SharedPreference.getData(key: "token")}");
    print("user Name  : ${SharedPreference.getData(key: "userName")}");

    print("user Type  : ${SharedPreference.getData(key: "userType")}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        drawer: DrawerEngineer(),
        body: BlocConsumer<EngineerCubit, EngineerStates>(
          builder: (BuildContext context, state) {
            EngineerCubit engineerCubit = EngineerCubit.get(context);
            return Padding(


              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(Icons.menu, size: 30, color: Colors.black),
                        ),
                        Text("home",style: TextStyle(fontSize: 20)),

                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.chevron_right_sharp,
                                size: 35, color: Colors.black)),

                      ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 20,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      child: ListTile(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const Request(),
                          //     ));
                        },
                        tileColor: Colors.white,
                        title: const Text("Requests", style: TextStyle(fontSize: 20)),
                        leading: Icon(Icons.mark_as_unread_sharp,
                            color: Colors.indigo.shade900, size: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 20,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  PostProfilePic (),
                              ));
                        },
                        tileColor: Colors.white,
                        title: const Text("upload profile pic", style: TextStyle(fontSize: 20)),
                        leading: Icon(Icons.person_pin_rounded,
                            color: Colors.indigo.shade900, size: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 20,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(),
                              ));
                        },
                        tileColor: Colors.white,
                        title: const Text("Chat", style: TextStyle(fontSize: 20)),
                        leading: Icon(Icons.mark_unread_chat_alt_outlined,
                            color: Colors.indigo.shade900, size: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 20,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ));
                        },
                        tileColor: Colors.white,
                        title: const Text("Profile", style: TextStyle(fontSize: 20)),
                        leading: Icon(Icons.person,
                            color: Colors.indigo.shade900, size: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 20,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommunityPage(),
                              ));
                        },
                        tileColor: Colors.white,
                        title: Text("Community", style: TextStyle(fontSize: 20)),
                        leading: Icon(Icons.groups_rounded,
                            color: Colors.indigo.shade900, size: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 20,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  NewPost(),
                              ));
                        },
                        tileColor: Colors.white,
                        title: const Text("Post", style: TextStyle(fontSize: 20)),
                        leading:
                        Icon(Icons.add, color: Colors.indigo.shade900, size: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 20,
                      shadowColor: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      child: ListTile(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => SearchPage(),
                          //     ));
                        },
                        tileColor: Colors.white,
                        title: Text("Search", style: TextStyle(fontSize: 20)),
                        leading: Icon(Icons.search_sharp,
                            color: Colors.indigo.shade900, size: 30),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          listener: (BuildContext context, Object? state) {
            if (state is ServerErrorEngineer) {
              CreatToast().showToast(
                  errorMessage: serverError, context: context, duration: 5);
            }
          },
        ));
  }
}
