
import 'package:clint_store/client_Screens/home_screen_cl/home.dart';
import 'package:clint_store/client_screens/sign_up_client/signup_client.dart';
import 'package:clint_store/common_widget/creat_loading.dart';
import 'package:clint_store/engineer_Screen/home_screen_en/home_screen_en.dart';
import 'package:clint_store/interduce_pages/choose_client_or_engineer.dart';

import 'package:clint_store/utilities/routes_manager.dart';
import 'package:clint_store/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_manager/local_data.dart';

import '../common_widget/create_toast.dart';
import '../cubit/application_state/auth_states.dart';
import '../cubit/cubits/auth_cubit.dart';
import '../engineer_screen/sign_up_engineer/signup.dart';

class LoginScreen extends StatelessWidget {
  final String userType;

  LoginScreen({super.key, required this.userType});

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff070F2B),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              RoutesManager.navigatorAndRemove(
                  context, ChooseClientOrEngineer());
            },
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              //height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff070F2B),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    // fit: BoxFit.scaleDown
                  )),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 5, 2, 0),
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(children: [
                    Text("Log in as ${userType}",
                        style: BlackTitle.display5(context)
                            .copyWith(fontSize: 20)),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      // validator: (value) {
                      //   if (emailController.text.isNotEmpty) {
                      //     return null;
                      //   } else {
                      //     return "email must not be empty";
                      //   }
                      // },
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.email_outlined,
                            color: Color(0xff070F2B), size: 25),
                        hintText: "e_mail",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      // validator: (value) {
                      //   if (passwordController.text.isNotEmpty) {
                      //     return null;
                      //   } else {
                      //     return "password must not be empty";
                      //   }
                      // },
                      decoration: const InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(Icons.lock_outline_sharp,
                            color: Color(0xff070F2B), size: 25),
                        hintText: "password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 30, 50, 0.25),
                      child: BlocProvider(
                        create: (BuildContext context) {
                          return AuthCubit();
                        },
                        child: BlocConsumer<AuthCubit, AuthStates>(
                          builder: (BuildContext context, state) {
                            AuthCubit authCubit = AuthCubit.get(context);
                            return

                             state is LoginLoadingClient||state is LoginLoadingEngineer?CreatLoading():
                              MaterialButton(
                              onPressed: () {
                                print(
                                    " emailController: ${emailController.text}");
                                print(
                                    "passwordController : ${passwordController.text}");

                                print("CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC $userType");




                                FocusScope.of(context).unfocus();
                                if (emailController.text.trim().isEmpty ||
                                    passwordController.text.trim().isEmpty) {
                                  CreatToast().showToast(
                                      errorMessage: "من فضلك اكمل بياناتك",
                                      context: context);
                                } else {
                                  if (userType == "Client") {
                                    authCubit.loginAsClient(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  } else  if (userType == "Engineer") {
                                    authCubit.loginAsEngineer(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                }
                              },
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(35)),
                              textColor: Colors.white,
                              minWidth: double.infinity,
                              height: 50,
                              color: Color(0xff070F2B),
                              elevation: 0.5,
                              child: const Text(
                                "Login ",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                ),
                              ),
                            );
                          },
                          listener: (BuildContext context, Object? state) {
                            AuthCubit authCubit = AuthCubit.get(context);
                            if (state is LoginSuccessClient) {
                              CreatToast().showToast(
                                  context: context,
                                  errorMessage: 'تم التسجيل بنجاح');
                              RoutesManager.navigatorAndRemove(
                                  context, HomeScreenClient());
                            } else if (state is LoginSuccessEngineer) {
                              CreatToast().showToast(
                                  context: context,
                                  errorMessage: 'تم التسجيل بنجاح');
                              RoutesManager.navigatorAndRemove(
                                  context, HomeScreenEngineer());
                            } else if (state is LoginErrorClient ||
                                state is LoginErrorEngineer) {
                              CreatToast().showToast(
                                  context: context,
                                  errorMessage:
                                      'عفوا لقد حدث خطأ ولم يتم تسجيل دخول');

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
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("i don't have an Account ",style: BlackTitle.display5(context),),
                        TextButton(
                          onPressed: () {




                            userType == "Client"
                                ? RoutesManager.navigatorPush(
                                    context, SignUpClient(userType: userType))
                                : RoutesManager.navigatorPush(context,
                                    SignUpEngineer(userType: userType));
                          },
                          child:  Center(
                              child: Text("sign up.",
                                  style:BlackTitle.display5(context).copyWith(color: Color(0xff070F2B))

                              )),
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
