
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_manager/local_data.dart';
import '../../client_Screens/home_screen_cl/home.dart';
import '../../common_widget/make_button.dart';
import '../../utilities/routes_manager.dart';
import '../../utilities/text_style.dart';





///////////////////////////////////////////////////////////////////////////////


class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 100,),
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 10),
              child: SvgPicture.asset(
                "assets/images/sucess3.svg",
              ),
            ),
////////////////////////////////////////////////////////////////////////////////// logo
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/images/sucess1.svg",
                            color: Color(0xffF5F5F5),
                          ),
                          SvgPicture.asset(
                            "assets/images/sucess2.svg",
                            // height: 120,
                          )
                        ],
                      ),
                    ),
                  ),
                  CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
////////////////////////////////////////////////////////////////////////////////// description
            SizedBox(
              height: 10,
            ),
            Text(
              "Your order will be delivered soon\n"
                  "Thank you for choosing our app!",
              style: BlackTitle.display5(context).copyWith(fontSize: 20),
            ),
////////////////////////////////////////////////////////////////////////////////// two buttons
//             MakeButton(
//               borderRadius: 10,
//               topMargin: 40,
//               bottomMargin: 20,
//               width: getSize(context: context).width * 0.6,
//               height:getSize(context: context).width * 0.15 ,
//               title: 'Track your orders',
//               onTap: () {},
//               backGroundColor: Color(0xff070F2B),
//             ),
          SizedBox(height: 10,),
            Container(
              height:getSize(context: context).width * 0.15 ,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: MakeButton(

                borderRadius: 10,
                width: getSize(context: context).width * 0.6,
                backGroundColor: Colors.transparent,
                title: 'BACK TO HOME',
                onTap: () {
                  RoutesManager.navigatorPush(context, HomeScreenClient());
                },
                titleStyle: BlackTitle.display5(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}