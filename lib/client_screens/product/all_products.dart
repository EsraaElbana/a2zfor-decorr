import 'package:clint_store/client_Screens/product/product_design.dart';
import 'package:clint_store/client_screens/product/product_details.dart';
import 'package:clint_store/client_screens/product/product_grid_view_design.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_manager/local_data.dart';



import '../../client_Screens/creat_drawer_cl/creat_drawer.dart';
import '../../common_widget/create_toast.dart';
import '../../common_widget/make_appbar.dart';
import '../../cubit/application_state/client_states.dart';
import '../../cubit/cubits/client_cubit.dart';
import '../../models/product_model_client.dart';
import '../../utilities/routes_manager.dart';
import '../../utilities/text_style.dart';

class AllProducts extends StatelessWidget {
  final List<Product> productList;
final String category;
  AllProducts({super.key, required this.productList, required this.category});
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: CreatDrawerClient(),
      appBar: CreatAppBar(
        hasTitle: true,    hasCart:true,
        hasBackButton: true,

        title: '$category',
        onDrawerPressed: () {
          _key.currentState!.openDrawer();

        },
        hasDrawer: true,
      ),
      body: SafeArea(
        child: Column(
          children: [

/////////////////////////////////////////////////////////////////////////////////////////// all Items

            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: CreatProductView(
                  physics: AlwaysScrollableScrollPhysics(),
                  productList: productList,
                ),
              ),
            ),
/////////////////////////////////////////////////////////////////////////////////////////// Similar Items
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
height: 1,
         color:   Colors.grey,
            width: double.infinity,

          ),
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
                  // color: Colors.amber,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: productList.length,
                      itemBuilder: (context, index) => InkWell(
                            onTap: () {

                              RoutesManager.navigatorPush(
                                  context,
                                  ProductDetailsScreen(
                                    staticList: productList,
                                    product: productList[index],
                                  ));
                            },
                            child:
                            BlocConsumer<ClientCubit, ClientStates>(
                              builder: (BuildContext context, state) {
                                ClientCubit clientCubit = ClientCubit.get(context);
                                return          Container(
                                  width: getSize(context: context).width * 0.4,
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: CreatProduct(
                                    onTap: (){
                                      clientCubit.addToCart(productId: productList[index].id!, Quantity: 1);
                                    },
                                    product: productList[index],
                                  ),
                                );
                              },
                              listener: (BuildContext context, Object? state) {


                                if (state is ServerErrorClient) {
                                  CreatToast().showToast(
                                      errorMessage: serverError, context: context, duration: 5);
                                }else if(state is AddToCartError){
                                  CreatToast().showToast(errorMessage: "عفوا حدث خطأ ولم يتم إضافه المنتج الي الساه", context: context);
                                }
                                else if(state is AddToCartSuccess){
                                  CreatToast().showToast(errorMessage: "تمت إضافه المنتج الي السله", context: context);
                                }

                              },
                            ),

                          )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
