import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_manager/local_data.dart';
import '../../../common_widget/create_toast.dart';
import '../../../cubit/application_state/auth_states.dart';
import '../../../cubit/application_state/engineer_states.dart';
import '../../../cubit/cubits/auth_cubit.dart';
import '../../../cubit/cubits/engineer_cubit.dart';
import '../../../engineer_Screen/home_screen_en/home_screen_en.dart';
import '../../../services/shared_preference.dart';
import '../../../utilities/routes_manager.dart';
import '../../../utilities/text_style.dart';


class PostProfilePic extends StatelessWidget {
  PostProfilePic({Key? key}) : super(key: key);

  final _engineerCubit = EngineerCubit();

  @override

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<EngineerCubit, EngineerStates>(
        listener: (BuildContext context, Object? state) {
          AuthCubit authCubit = AuthCubit.get(context);
          if (state is ProfilePicSuccessState ) {
            CreatToast().showToast(
                context: context,
                errorMessage: 'تم ');
            RoutesManager.navigatorAndRemove(
                context, HomeScreenEngineer());
          } else if (state is ProfilePicFailedState ||
              state is ProfilePicFailedState) {
            CreatToast().showToast(
                context: context,
                errorMessage:
                'عفوا لقد حدث خطأ ولم يتم رفع الصوره'
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  ' ${authCubit.errorLoginMessage}',
                  style: WhiteTitle.display5(context),
                ),
                duration: Duration(seconds: 15),
                behavior: SnackBarBehavior.floating,
                action: SnackBarAction(
                  label: 'Close',
                  onPressed: () {
                    ScaffoldMessenger.of(context)
                        .hideCurrentSnackBar();
                  },
                ),
              ),
            );
          } else if (state is ServerErrorAuth) {
            CreatToast().showToast(
                errorMessage: serverError,
                context: context,
                duration: 5);
          }
        },
        builder: (BuildContext context, state) {
          EngineerCubit engineerCubit = EngineerCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            body:
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 7),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 28.0),
                                child: engineerCubit.img !=
                                    null
                                    ? CircleAvatar(
                                  radius: 85,
                                  child: Image.file(
                                    engineerCubit.img!,

                                  ),
                                )
                                    : CircleAvatar(

                                  radius: 85,
                                  backgroundColor: Color(0xFF12133C),
                                  child: Image.asset(
                                    "assets/images/Ellipse 2.png",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<EngineerCubit>(context)
                                        .getImageFromGalleryLicencePic();
                                  },
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Color(0xFF12133C),
                                    child: Image.asset(
                                      "assets/images/edit-2.png",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text("${SharedPreference.getData(key: "userName")}"),
                        // const Text("Interior designer"),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      engineerCubit.postImage(

                          engineerCubit.img!);

                    },
                    child: Text('Upload Image'),
                  ),
                ],
              ),
            ),);


        }
    );}
}
