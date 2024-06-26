
import 'package:flutter/material.dart';

import '../../app_manager/local_data.dart';
import '../../utilities/text_style.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.only(top: 20, right: 15, left: 15),
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(flex: 2,
                  child: Container(
                    height: getSize(context: context).height * 0.12,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                      Border.all(color: Colors.blueGrey, width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set the border radius

                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(noImage),
                                fit: BoxFit.cover,
                              ))),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(flex: 5,
                  child: Container(
                    // height: getSize(context: context).height * 0.13,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Your order #123456789 has been confirmed",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: BlackLabel.display5(context)

                        ),
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: BlackLabel.display5(context).copyWith(color:Colors.grey,fontSize: 10)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}