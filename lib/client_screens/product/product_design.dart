import 'package:clint_store/cubit/application_state/client_states.dart';
import 'package:clint_store/cubit/cubits/client_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_manager/local_data.dart';

import '../../client_Screens/product/product_details.dart';
import '../../common_widget/creat_loading.dart';

import '../../models/product_model_client.dart';
import '../../utilities/routes_manager.dart';
import '../../utilities/text_style.dart';

class CreatProduct extends StatelessWidget {
  final Product product;
  final void Function() onTap;

  CreatProduct(
      {super.key, required this.product, required this.onTap,  });

  List<Color> productColors = [
    Color(0xffE7C4AB),
    Color(0xffABD1E7),
    Color(0xffCCABE7),
    Color(0xffAFABE7),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              RoutesManager.navigatorPush(
                  context,
                  ProductDetailsScreen(
                    product: product,
                    staticList:
                        BlocProvider.of<ClientCubit>(context).allProducts,
                  ));
            },
            child: Column(
              children: [
                ///////////////////////////////////////////////////////////////////////////////////// image product
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: getSize(context: context).height * 0.16,
                    margin: EdgeInsets.only(bottom: 8),
                    width: getSize(context: context).width,
                    child: Image.network(
                      product.images![0].imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
///////////////////////////////////////////////////////////////////////////////////////// product name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: BlackTitle.display5(context)
                            .copyWith(color: Color(0xff78798E)),
                      ),

////////////////////////////////////////////////////////////////////////////////////////////// prduct color
                      Container(
                        // margin: EdgeInsets.all(3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: List.generate(
                                  productColors.length,
                                  (index) => Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2, vertical: 5),
                                        height: 10,
                                        width: 10,
                                        decoration: BoxDecoration(
                                            color: productColors[index],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      )),
                            ),
                            product.priceAfterDiscount.toString().trim().isEmpty
                                ? SizedBox()
                                : Flexible(
                                    child: Text(
                                      "${num.parse(product.price.toString()).toStringAsFixed(2)} \$",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: BlackLabel.display5(context)
                                          .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.red),
                                    ),
                                  ),
                          ],
                        ),
                      ),

//////////////////////////////////////////////////////////////////////////////////////// product Price

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              product.priceAfterDiscount
                                      .toString()
                                      .trim()
                                      .isEmpty
                                  ? "${num.parse(product.price.toString()).toStringAsFixed(2)} \$"
                                  : "${num.parse(product.priceAfterDiscount.toString()).toStringAsFixed(2)} \$",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: BlackTitle.display5(context)
                                  .copyWith(color: Color(0xff000000)),
                            ),
                          ),
                         InkWell(
                                  onTap: onTap,
                                  child: Container(
                                    // height: 30,
                                    width: 60,
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xffD4DCFB),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      "Add To",
                                      style: BlackTitle.display5(context),
                                    ),
                                  ),
                                )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
