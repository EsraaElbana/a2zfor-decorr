import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_manager/local_data.dart';
import '../../client_Screens/creat_drawer_cl/creat_drawer.dart';
import '../../client_Screens/product/product_design.dart';
import '../../common_widget/creat_loading.dart';
import '../../common_widget/create_toast.dart';
import '../../common_widget/make_appbar.dart';
import '../../common_widget/make_button.dart';
import '../../common_widget/make_rate.dart';
import '../../cubit/application_state/client_states.dart';
import '../../cubit/cubits/client_cubit.dart';
import '../../models/product_model_client.dart';
import '../../utilities/text_style.dart';
import '../cart_screen/cart.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;
  final List<Product> staticList;

  ProductDetailsScreen(
      {super.key, required this.product, required this.staticList});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> productColor = [
    Color(0xffE7C4AB),
    Color(0xffABD1E7),
    Color(0xffCCABE7),
    Color(0xffAFABE7),
  ];

  List deliveryIcons = ["free1", "free2", "free3"];

  List deliveryNames = [
    "Free\nDelivery",
    "Free\nDelivery",
    "Secure\nTransaction"
  ];
  int quantity = 0;

  @override
  void initState() {
    super.initState();
  }
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: CreatDrawerClient(),
      appBar: CreatAppBar(
        hasTitle: true,    hasCart:true,
        hasBackButton: true,

        title: '${widget.product.name}',
        onDrawerPressed: () {
          _key.currentState!.openDrawer();

        },
        hasDrawer: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
////////////////////////////////////////////////////////////////////////////////////////////// product image
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: getSize(context: context).height * 0.2,
            width: getSize(context: context).width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.product.images![0].imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
///////////////////////////////////////////////////////////////////////////////////////// title
          Text(
            widget.product.name!,
            style: BlackTitle.display5(context),
          ),
///////////////////////////////////////////////////////////////////////////////////////// description
          Text(
            widget.product.desc!,
            // "The Modern Soft Chair boasts a harmonious blend of modern design and plush comfort. With its sleek lines, ",
            style: BlackLabel.display5(context),
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
///////////////////////////////////////////////////////////////////////////////////////// price

              Row(
                children: [
                  Text(
                    "${widget.product!.priceAfterDiscount!.toStringAsFixed(2)} \$ ",
                    style: BlackTitle.display5(context).copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${widget.product.price!.toStringAsFixed(2)} \$ ",
                    style: BlackLabel.display5(context).copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red),
                  ),
                ],
              ),

///////////////////////////////////////////////////////////////////////////////////////// add to cart

              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: getSize(context: context).width * 0.07,
                      width: getSize(context: context).width * 0.07,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: getSize(context: context).width * 0.07,
                    width: getSize(context: context).width * 0.07,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.grey)),
                    child: Text(
                      "$quantity",
                      style: BlackTitle.display5(context),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (quantity <= 0) {
                      } else {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: getSize(context: context).width * 0.07,
                      width: getSize(context: context).width * 0.07,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: Icon(
                        FontAwesomeIcons.minus,
                        color: Colors.grey,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

///////////////////////////////////////////////////////////////////////////////////////////// product color
          SizedBox(
            height: 10,
          ),
          Row(
            children: List.generate(
                productColor.length,
                (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: productColor[index],
                          borderRadius: BorderRadius.circular(10)),
                    )),
          ),
//////////////////////////////////////////////////////////////////////////////////////////// rate and reviews
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Row(
                  children: [
                    CreatRate2(),
                    SizedBox(width: 4),
                    Text(
                      "159 Reviews",
                      style: BlackLabel.display5(context),
                    )
                  ],
                ),
                // Row(children: ),
              ],
            ),
          ),
////////////////////////////////////////////////////////////////////////////////////////// Delivery

          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  3,
                  (index) => Card(
                        elevation: 5,
                        child: Container(
                          height: 120,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/${deliveryIcons[index]}.svg",
                                height: 40,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                deliveryNames[index],
                                style: BlackLabel.display5(context),
                              ),
                            ],
                          ),
                        ),
                      ))),
////////////////////////////////////////////////////////////////////////////////////////////////// Add To Cart buttons

          BlocConsumer<ClientCubit, ClientStates>(
            builder: (BuildContext context, state) {
              ClientCubit clientCubit = ClientCubit.get(context);
              return Column(
                children: [
                  Center(
                    child: state is AddToCartLoading
                        ? CreatLoading()
                        : MakeButton(
                            topMargin: 30,
                            width: getSize(context: context).width * 0.6,
                            title: "Add To Cart",
                            onTap: () {
                              if (quantity != 0) {
                                clientCubit.addToCart(
                                    productId: widget.product.id!,
                                    Quantity: quantity);
                              } else {
                                CreatToast().showToast(
                                    errorMessage: "من فضلك اختر الكميه",
                                    context: context);
                              }
                            },
                          ),
                  ),
//////////////////////////////////////////////////////////////////////////////////////////// Frequently Bought Together
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Frequently Bought Together",
                            style: BlackTitle.display5(context),
                          )),
                      Container(
                        height: getSize(context: context).height * 0.35,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: widget.staticList.length,
                            itemBuilder: (context, index) => Container(
                                  width: getSize(context: context).width * 0.4,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: CreatProduct(
                                    onTap: state is AddToCartLoading
                                        ? () {}
                                        : () {
                                            clientCubit.addToCart(
                                                productId: widget
                                                    .staticList[index].id!,
                                                Quantity: 1);
                                          },
                                    product: widget.staticList[index],
                                  ),
                                )),
                      )
                    ],
                  ),
//////////////////////////////////////////////////////////////////////////////////////////// Similar itmes
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Similar Items",
                            style: BlackTitle.display5(context),
                          )),
                      Container(
                        height: getSize(context: context).height * 0.35,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: widget.staticList.length,
                            itemBuilder: (context, index) => Container(
                                  width: getSize(context: context).width * 0.4,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: CreatProduct(
                                    onTap: state is AddToCartLoading
                                        ? () {}
                                        : () {
                                            clientCubit.addToCart(
                                                productId: widget
                                                    .staticList[index].id!,
                                                Quantity: 1);
                                          },
                                    product: widget.staticList[index],
                                  ),
                                )),
                      )
                    ],
                  )
                ],
              );
            },
            listener: (BuildContext context, Object? state) {
              if (state is ServerErrorClient) {
                CreatToast().showToast(
                    errorMessage: serverError, context: context, duration: 5);
              } else if (state is AddToCartError) {
                CreatToast().showToast(
                    errorMessage: "عفوا حدث خطأ ولم يتم إضافه المنتج الي الساه",
                    context: context);
              } else if (state is AddToCartSuccess) {
                CreatToast().showToast(
                    errorMessage: "تمت إضافه المنتج الي السله",
                    context: context);
              }
            },
          ),
        ],
      ),
    );
  }
}
