import 'package:clint_store/utilities/routes_manager.dart';
import 'package:clint_store/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_manager/local_data.dart';
import '../../common_widget/create_toast.dart';
import '../../common_widget/creat_loading.dart';
import '../../cubit/application_state/auth_states.dart';
import '../../cubit/cubits/auth_cubit.dart';

import '../../login/login_Screen.dart';

class SignUpClient extends StatelessWidget {


  final String userType;

   SignUpClient({super.key, required this.userType});


  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();



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
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              //height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff070F2B),
                  image: const DecorationImage(
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

              //height: double.infinity,
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
                    Text("Sign Up as ${userType}",
                        style: BlackTitle.display5(context)
                            .copyWith(fontSize: 20)),
                    const SizedBox(
                      height: 17,
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
                              color: Color(0xFF181A4D),
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
                      controller: passwordController,
                      // validator: (value) {
                      //   if (confirmPasswordController.text.isEmpty) {
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
                      controller: confirmPasswordController,
                      // validator: (value) {
                      //   if (confirmPasswordController.text.isEmpty) {
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
                      height: 14,
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
                            child: state is RegisterLoadingClient
                                ? CreatLoading()
                                : MaterialButton(
                                    onPressed: () {

                                      print(
                                          "usernameController : ${usernameController.text}");

                                      print(
                                          "emailController : ${emailController.text}");
                                      print(
                                          "passwordController : ${passwordController.text}");
                                      print(
                                          "repassController : ${confirmPasswordController.text}");
                                      FocusScope.of(context).unfocus();
                                      if (passwordController.text !=
                                              confirmPasswordController.text ||
                                          passwordController.text
                                              .trim()
                                              .isEmpty ||
                                          confirmPasswordController.text
                                              .trim()
                                              .isEmpty) {
                                        CreatToast().showToast(
                                            errorMessage:
                                                "كلمه المرور غير متطابقه",
                                            context: context);
                                      } else if (usernameController.text
                                              .trim()
                                              .isEmpty ||
                                          emailController.text.trim().isEmpty) {
                                        CreatToast().showToast(
                                            errorMessage:
                                                "من فضلك اكمل بياناتك",
                                            context: context);
                                      } else {
                                        authCubit.registerAsClient(
                                            userName: usernameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            confirmPassword:
                                                confirmPasswordController.text);
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
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal)),
                                  ),
                          );
                        },
                        listener: (BuildContext context, Object? state) {
                          AuthCubit authCubit = AuthCubit.get(context);
                          if (state is RegisterSuccessClient) {
                            CreatToast().showToast(
                                context: context,
                                errorMessage: 'تم التسجيل بنجاح');
                            RoutesManager.navigatorAndRemove(
                                context, LoginScreen(userType:userType,));
                          } else if (state is RegisterErrorClient) {
                            CreatToast().showToast(
                                context: context,
                                errorMessage:
                                    'عفوا لقد حدث خطأ ولم يتم التسجيل');

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  ' ${authCubit.errorClientRegisterMessage}',
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
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("i have an account ",style: BlackTitle.display5(context),),
                        TextButton(
                          onPressed: () {
                            RoutesManager.pop(context);

                          },
                          child:  Center(
                              child: Text("sign in.",

                                  style:BlackTitle.display5(context).copyWith(color: Color(0xff070F2B))

                                  ))),

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
