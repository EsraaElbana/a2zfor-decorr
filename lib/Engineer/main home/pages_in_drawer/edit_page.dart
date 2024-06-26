import 'dart:io';

import 'package:clint_store/cubit/application_state/engineer_states.dart';
import 'package:clint_store/cubit/cubits/engineer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/shared_preference.dart';
import 'edite profile.dart';

class EngineerEditingPage extends StatefulWidget {
  const EngineerEditingPage({Key? key}) : super(key: key);

  @override
  State<EngineerEditingPage> createState() => _EngineerEditingPageState();
}

//
class _EngineerEditingPageState extends State<EngineerEditingPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  // final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return BlocConsumer<EngineerCubit, EngineerStates>(

        listener: (context, state) {},
        builder: (context, state) {
          EngineerCubit engineerCubit = EngineerCubit.get(context);
          //if (cubit.engModel == null) cubit.getUserData();
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
              title: const Text(
                "Editing",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Container(
                        //color: Colors.deepPurple,
                        // height: MediaQuery.of(context).size.height*0.9,
                        child: Column(
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 28.0),
                                child: InkWell(
                                  onTap: () {
                                    // pickerGallery();
                                    // Navigator.push(context, route)
                                  },
                                  child: CircleAvatar(
                                      radius: 59,
                                      backgroundColor: Colors.white,
                                      backgroundImage: AssetImage(
                                          "assets/images/Ellipse 2.png")
                                      //
                                      //  NetworkImage( cubit.engModel!.profilePic!.secureUrl!
                                      //  ),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        EditProfile("Name", nameController),
                        EditProfile("Phone Number", passwordController),
                        // edit_profile("Password",passwordController),
                        EditProfile("Country / Region", addressController),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              75 * ffem, 15 * ffem, 75 * ffem, 10 * ffem),
                          child: BlocConsumer<EngineerCubit, EngineerStates>(
                              listener: (context, state) {
                            if (state is EditEngineerSuccess) {
                              showSnackBarItem(
                                  context, "Data Updated Successfully", true);
                              Navigator.pop(context);
                            }
                            if (state is EditEngineerError) {
                              showSnackBarItem(context,engineerCubit.errorMessage!, false);
                            }
                          }, builder: (context, state) {
                            return MaterialButton(
                              onPressed: () {
                                if (nameController.text.isNotEmpty &&
                                    phoneController.text.isNotEmpty &&
                                    addressController.text.isNotEmpty) {
                                 engineerCubit
                                      . editEngineer(
                                          userName: nameController.text,
                                          phoneNumber: phoneController.text,
                                           address: addressController.text);
                                } else {
                                  showSnackBarItem(context,
                                      'Please, Enter all Data !!', false);
                                }
                              },
                              color: Colors.indigo[900],
                              textColor: Colors.white,
                              child: Text(

                                  "Update"),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

void showSnackBarItem(
    BuildContext context, String message, bool forSuccessOrFailure) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: forSuccessOrFailure ? Colors.green : Colors.red,
  ));
}
