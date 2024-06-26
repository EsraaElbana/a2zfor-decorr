import 'package:clint_store/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/creat_alert_dialog.dart';
import '../../common_widget/creat_loading.dart';
import '../../common_widget/create_toast.dart';
import '../../cubit/application_state/auth_states.dart';
import '../../cubit/cubits/auth_cubit.dart';
import '../../login/login_Screen.dart';
import '../../utilities/routes_manager.dart';

class SignUpEngineer extends StatefulWidget {
  final String userType;

  SignUpEngineer({super.key, required this.userType});

  @override
  State<SignUpEngineer> createState() => _SignUpEngineerState();
}

class _SignUpEngineerState extends State<SignUpEngineer> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  XFile? userIdentityImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              RoutesManager.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Color(0xff070F2B),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              //height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xff070F2B),
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    //fit: BoxFit.scaleDown
                  )),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffc58a00),
                  // border: 3px solid rgba(210, 171, 69, 1)// Change border color here
                  width: 2, // Set border width
                ),
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Text("Sign Up as ${widget.userType}",
                        style: BlackTitle.display5(context)
                            .copyWith(fontSize: 20)),
                    const SizedBox(
                      height: 14,
                    ),
                    TextFormField(
                      controller: usernameController,
                      // validator: (value) {
                      //   if (usernameController.text.isEmpty) {
                      //     return 'please enter Your Name';
                      //   }
                      //   return null;
                      // },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_sharp,
                            color: Color(0xff070F2B), size: 25),
                        isDense: true,
                        hintText: "User Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                              color: Color(0xff070F2B),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: emailController,
                      // validator: (value) {
                      //   if (emailController.text.isEmpty) {
                      //     return 'please enter Your email';
                      //   }
                      //   return null;
                      // },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.email_outlined,
                            color: Color(0xff070F2B), size: 25),
                        hintText: "e_mail",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: phoneController,
                      // validator: (value) {
                      //   if (phoneController.text.isEmpty) {
                      //     return 'please enter Your Phone number';
                      //   }
                      //   return null;
                      // },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.phone,
                            color: Color(0xff070F2B), size: 25),
                        hintText: "Phone number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: Color(0xff070F2B),
                            width: 15.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: addressController,
                      // validator: (value) {
                      //   if (addressController.text.isEmpty) {
                      //     return 'please enter Your address';
                      //   }
                      //   return null;
                      // },
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.location_on_outlined,
                            color: Color(0xff070F2B), size: 25),
                        hintText: "address",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: passwordController,
                      // validator: (value) {
                      //   if (confirmController.text.isEmpty) {
                      //     return 'please enter password';
                      //   }
                      //   return null;
                      // },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.lock_outline,
                            color: Color(0xff070F2B), size: 25),
                        hintText: "password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: confirmController,
                      // validator: (value) {
                      //   if (confirmController.text.isEmpty) {
                      //     return 'please confirm the password';
                      //   }
                      //   return null;
                      // },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_sharp,
                            color: Color(0xff070F2B), size: 25),
                        isDense: true,
                        hintText: " confirm password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

/////////////////////////////////////////////////////////////////////////////////////////////////// user identity
                    InkWell(
                      onTap: () {
                        ImagePicker picker = ImagePicker();

                        CreatAlertDialog().SelectCameraOrGallery(
                            context: context,
                            onCameraPress: () async {
                              Navigator.pop(context);
                              userIdentityImage = await picker.pickImage(
                                  source: ImageSource.camera);
                              setState(() {});
                            },
                            onGalleryPressed: () async {
                              Navigator.pop(context);
                              userIdentityImage = await picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {});
                            });
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            width: getSize(context: context).width * 0.4,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.camera_alt_outlined,
                                  color: Color(0xff070F2B),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "add image",
                                  style: BlackTitle.display5(context),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          userIdentityImage != null
                              ? Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.file(
                                      File(userIdentityImage!.path),
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
/////////////////////////////////////////////////////////////////////////////////////////////////
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(),
                          child: null,
                        ),
                      ],
                    ),
                    BlocProvider(
                      create: (BuildContext context) {
                        return AuthCubit();
                      },
                      child: BlocConsumer<AuthCubit, AuthStates>(
                        builder: (BuildContext context, state) {
                          AuthCubit authCubit = AuthCubit.get(context);
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(55, 2.5, 55, 10),
                            child: state is RegisterLoadingEngineer
                                ? CreatLoading()
                                : MaterialButton(
                                    onPressed: () async {
                                      FocusScope.of(context).unfocus();

                                      print(
                                          "usernameController ${usernameController.text}");
                                      print(
                                          "emailController ${emailController.text}");
                                      print(
                                          "phoneController ${phoneController.text}");
                                      print(
                                          "addressController ${addressController.text}");
                                      print(
                                          "passwordController ${passwordController.text}");
                                      print(
                                          "confirmController ${confirmController.text}");

                                      if (passwordController.text !=
                                          confirmController.text) {
                                        CreatToast().showToast(
                                            errorMessage:
                                                "من فضلك كلمه المرور غير متطابقه",
                                            context: context);
                                      } else if (usernameController.text
                                              .trim()
                                              .isEmpty ||
                                          emailController.text.trim().isEmpty ||
                                          phoneController.text.trim().isEmpty ||
                                          addressController.text
                                              .trim()
                                              .isEmpty ||
                                          userIdentityImage == null) {
                                        CreatToast().showToast(
                                            errorMessage:
                                                "من فضلك اكمل بياناتك وتأكد من رفع صوره الباطاقه",
                                            context: context);
                                      } else {
                                        authCubit.registerAsEngineer(
                                            userName: usernameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phoneNumber: phoneController.text,
                                            userAddress: addressController.text,
                                            userIdentityImage:
                                                File(userIdentityImage!.path));
                                      }
                                    },
                                    shape: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xff070F2B),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    textColor: Colors.white,
                                    minWidth: double.infinity,
                                    height: 50,
                                    color: Color(0xff070F2B),
                                    elevation: 0.5,
                                    child: Text("Sign up",
                                        style: WhiteLabel.display5(context)
                                            .copyWith(fontSize: 20)),
                                  ),
                          );
                        },
                        listener: (BuildContext context, Object? state) {
                          if (state is RegisterSuccessEngineer) {
                            CreatToast().showToast(
                                context: context,
                                errorMessage: 'تم التسجيل بنجاح');
                            RoutesManager.navigatorAndRemove(context,
                                LoginScreen(userType: widget.userType));
                          } else if (state is RegisterErrorEngineer) {
                            CreatToast().showToast(
                                context: context,
                                errorMessage:
                                    'عفوا لقد حدث خطأ ولم يتم التسجيل');
                          } else if (state is ServerErrorAuth) {
                            CreatToast().showToast(
                                errorMessage: serverError,
                                context: context,
                                duration: 5);
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "i have an account ",
                          style: BlackTitle.display5(context),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen(userType: widget.userType);
                            }));
                          },
                          child: const Center(
                              child: Text("sign in.",
                                  style: TextStyle(
                                    color: Color(0xff070F2B),
                                  ))),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
