import 'package:clint_store/cubit/application_state/client_states.dart';
import 'package:clint_store/cubit/cubits/client_cubit.dart';
import 'package:clint_store/interduce_pages/choose_client_or_engineer.dart';
import 'package:clint_store/services/shared_preference.dart';
import 'package:clint_store/utilities/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'client_Screens/home_screen_cl/home.dart';

import 'engineer_Screen/home_screen_en/home_screen_en.dart';
import 'interduce_pages/choose_login_or_register.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    // SharedPreference.setData(key: "userId",value: "");

    Future.delayed(Duration(seconds: 2
    ), () {
      // print(
      //     "userId in  splash screen : ${SharedPreference.getData(key: "userId")}");

      if (SharedPreference.getData(key: "userId") == null ||
          SharedPreference.getData(key: "userId").toString().isEmpty) {
        SharedPreference.clear();
        RoutesManager.navigatorAndRemove(context, ChooseClientOrEngineer());
        print("this is the first time to enter the application");
      } else {
        if (SharedPreference.getData(key: "userType") == "Client" &&
            (SharedPreference.getData(key: "userId").toString().isNotEmpty ||
                SharedPreference.getData(key: "userId") != null)) {
          RoutesManager.navigatorAndRemove(context, HomeScreenClient());
          print("login as Client with saved id");
        } else {
          print("Login as Engineer with saved id");


          RoutesManager.navigatorAndRemove(context, HomeScreenEngineer());


        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientCubit, ClientStates>(builder: (BuildContext context, state) {
      return Scaffold(
        backgroundColor: Color(0xff070F2B),

        body: Container(
          child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: double.infinity,
                width: double.infinity,
              )),
        ),
      );
    }, listener: (BuildContext context, Object? state) {

      // print("kjjjjjjjjjjjjjjjjjj   : $state");
    },);
  }
}
