
import 'package:flutter/material.dart';

import '../../app_manager/local_data.dart';

import '../../common_widget/make_button.dart';
import '../../utilities/text_style.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              // physics:  NeverScrollableScrollPhysics(),
              //
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 20, right: 15, left: 15),
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
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
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: getSize(context: context).height * 0.13,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Text(
                                            "modern soft svhais ",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: BlackTitle.display5(context)
                                                .copyWith(color: Colors.grey),
                                          )),
                                      Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.black,
                                        size: 18,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Text("50 \$",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: BlackLabel.display5(context))),
                                    ],
                                  ),
                                  Spacer(),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(),
                                      Icon(
                                        Icons.shopping_bag_rounded,
                                        color: Colors.black,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                MakeButton(
                  title: "Add all to my Cart",
                  onTap: () {},
                  topMargin: 20,
                  bottomMargin: 20,
                ),
              ],
            ),
          )),
    );
  }
}