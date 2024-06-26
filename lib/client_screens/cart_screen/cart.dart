
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app_manager/local_data.dart';
import '../../checkout_form/checkout_form.dart';
import '../../client_Screens/creat_drawer_cl/creat_drawer.dart';
import '../../common_widget/make_appbar.dart';
import '../../common_widget/make_button.dart';

import '../../utilities/text_style.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: CreatDrawerClient(),
      appBar: CreatAppBar(
        hasTitle: true,    hasCart:false,
        hasBackButton: true,

        title: 'Cart Screen',
        onDrawerPressed: () {
          _key.currentState!.openDrawer();

        },
        hasDrawer: true,
      ),
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 20,
                ),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: getSize(context: context).height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blueGrey, width: 1),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the border radius

                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
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
                        flex: 4,
                        child: Container(
                          height: getSize(context: context).height * 0.2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      child: Text(
                                        "modern soft svhais ",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: BlackTitle.display5(context),
                                      )),
                                  Icon(
                                    FontAwesomeIcons.xmark,
                                    color: Colors.black,
                                    size: 18,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                      child: Text(
                                        "modern soft svhais ",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: BlackLabel.display5(context)
                                            .copyWith(color: Colors.grey, fontSize: 10),
                                      )),
                                ],
                              ),
                               // Spacer(),
                              Text(
                                "23.00 \$",
                                style: BlackLabel.display5(context).copyWith(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "23.00 \$",
                                    style: BlackTitle.display5(context)
                                    ,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                        getSize(context: context).width * 0.07,
                                        width:
                                        getSize(context: context).width * 0.07,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5, color: Colors.grey)),
                                        child: Icon(
                                          FontAwesomeIcons.plus,
                                          color: Colors.grey,
                                          size: 18,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                        getSize(context: context).width * 0.07,
                                        width:
                                        getSize(context: context).width * 0.07,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5, color: Colors.grey)),
                                        child: Text(
                                          "2",
                                          style: BlackTitle.display5(context),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        height:
                                        getSize(context: context).width * 0.07,
                                        width:
                                        getSize(context: context).width * 0.07,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5, color: Colors.grey)),
                                        child: Icon(
                                          FontAwesomeIcons.minus,
                                          color: Colors.grey,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              creatCartTotal(title: "subtotal", price: "20 \$"),
              creatCartTotal(title: "Discount ( 20 % ) ", price: "20 \$"),
              creatCartTotal(title: "Delivery Free", price: "20 \$"),
              creatCartTotal(title: "Total", price: "20 \$"),
              MakeButton(
                title: "Go To CheckOut",
                onTap: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutForm()));
                  });
                },
                borderRadius: 20,
                topMargin: 20,
                bottomMargin: 20,
              ),
              SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }

  Widget creatCartTotal({required String title, required String price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: BlackTitle.display5(context)
              .copyWith(color: Colors.grey, fontSize: 18),
        ),
        Text(price,
            style: BlackTitle.display5(context)
                .copyWith(color: Colors.grey, fontSize: 16))
      ],
    );
  }
}