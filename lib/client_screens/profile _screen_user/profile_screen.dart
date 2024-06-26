import 'package:flutter/material.dart';

import '../../app_manager/local_data.dart';
import '../../client_Screens/creat_drawer_cl/creat_drawer.dart';
import '../../common_widget/make_appbar.dart';
import '../../utilities/text_style.dart';


class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: CreatDrawerClient(),
      appBar: CreatAppBar(
        hasTitle: true,
        hasCart:true,
        hasBackButton: true,

        title: 'Profile Screen',
        onDrawerPressed: () {
          _key.currentState!.openDrawer();

        },
        hasDrawer: true,
      ),
      backgroundColor: Color(0xffF0F1F3),

      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 38,
                    backgroundImage: NetworkImage(noImage),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mohamed Ali",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BlackTitle.display5(context)
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          "mano5645@gmail.com",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: BlackTitle.display5(context)
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            creatDetails(
                title: "My Orders",
                subTitle: "Already have 10 orders",
                context: context,
                onTap: () {}),
            creatDetails(
                title: "Shipping Addresses",
                subTitle: "03 Address",
                context: context,
                onTap: () {}),
            creatDetails(
                title: "payment Method",
                subTitle: "you have 3 cards",
                context: context,
                onTap: () {}),
            creatDetails(
                title: "My reviews",
                subTitle: "Review for 5 items",
                context: context,
                onTap: () {}),
            creatDetails(
                title: "Setting",
                subTitle: "Notification, Password, FAQ, Contact",
                context: context,
                onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget creatDetails(
      {required String title,
        required String subTitle,
        required BuildContext context,
        required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: BlackTitle.display5(context),
                  ),
                  Text(
                    subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: BlackLabel.display5(context)
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xff242424),
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}