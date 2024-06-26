
import 'package:flutter/material.dart';

import '../../app_manager/local_data.dart';
import '../../common_widget/make_button.dart';

import '../../utilities/text_style.dart';


class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0F1F3),
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                creatButtons(title: 'Delivered', titleStyle: BlackTitle.display5(context)),
                creatButtons(title: 'Processing', titleStyle: BlackTitle.display5(context)),
                creatButtons(title: 'Canceled', titleStyle: BlackTitle.display5(context)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) => creatOrder(
                    context: context,
                    orderNumber: '55672376326',
                    orderDate: '20/20/2020',
                    quantity: '06',
                    orderTotalPrince: '139',
                    orderStatus: 'Deliverid')),
          ),
        ],
      ),
    );
  }

  Widget creatButtons({required String title, required TextStyle titleStyle}) {
    return Column(
      children: [
        Text(
          title,
          style: titleStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 5,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(5)),
        )
      ],
    );
  }

  Widget creatOrder(
      {required BuildContext context,
        required String orderNumber,
        required String orderDate,
        required String quantity,
        required String orderTotalPrince,
        required String orderStatus}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                    "order no $orderNumber",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: BlackTitle.display5(context),
                  )),
              Flexible(
                  child: Text(
                    orderDate,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                    BlackLabel.display5(context).copyWith(color: Colors.grey),
                  )),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: getSize(context: context).width,
            height: 1,
            color: Color(0xffF0F0F0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Quantity :",
                    style: BlackTitle.display5(context)
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    quantity,
                    style: BlackTitle.display5(context),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Total Amount : ",
                    style: BlackTitle.display5(context)
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "$orderTotalPrince \$",
                    style: BlackTitle.display5(context),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MakeButton(
                title: "Details",
                onTap: () {},
                topMargin: 20,
                bottomMargin: 20,
                borderRadius: 5,
                width: getSize(context: context).width * 0.25,
                height:getSize(context: context).width*0.09 ,
              ),
              Text(
                orderStatus,
                style:
                BlackTitle.display5(context).copyWith(color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}