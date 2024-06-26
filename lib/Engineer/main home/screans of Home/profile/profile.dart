import 'dart:io';
import 'package:clint_store/models/product_model_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../cubit/application_state/engineer_states.dart';
import '../../../../cubit/cubits/engineer_cubit.dart';
import '../../../../services/shared_preference.dart';


class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  XFile? profileImage;
  List<File> _images = [];

  Future<void> _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      setState(() {
        _images.add(File(image.path));
      });
    }
  }
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
    return BlocConsumer<EngineerCubit, EngineerStates>(
        listener: (context, state) {},
        builder: (context, state) {
          EngineerCubit engineerCubit = EngineerCubit.get(context);
          // if (cubit.engModel == null) cubit.getUserData();
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              // drawer: DrawerEngineer(),
              body: Column(
                children: [
                  Expanded(
                    flex: 14,
                    child: Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 7),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 28.0),
                                      child: SharedPreference.getData(key: "profileImage") == null?
                                      CircleAvatar(
                                        radius: 59,
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage("assets/images/Ellipse 2.png")

                                      ): CircleAvatar(
                                        radius: 59,
                                        backgroundColor: Colors.white,
                                        child:
                                           Image.network(SharedPreference.getData(key: "engImageProfile")),
                                      )
                                      ),
                                  ),
                                  Text("${SharedPreference.getData(key: "userName")}"),
                                  const Text("Interior designer"),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ImageIcon(AssetImage(
                                          "assets/images/locate.png")),
                                      SizedBox(width: 5,),

                                      Text("${SharedPreference.getData(key: "userAddress")}"),

                                      // Text(cubit.engModel!.address![0]),
                                    ],
                                  ),
                                  // Text("Rate")
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Divider(
                          endIndent: 15,
                          indent: 15,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("My Work",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 15,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                        ),
                        itemCount: _images.length + 1,
                        itemBuilder: (context, index) {
                          if (index == _images.length) {
                            return GestureDetector(
                              onTap: () {
                                _pickImage(ImageSource.gallery);
                              },
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Icon(Icons.add),
                              ),
                            );
                          } else {
                            return Image.file(_images[index]);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              )
              // : const Center(
              //     child: CircularProgressIndicator(),

              );
        });
  }
}
