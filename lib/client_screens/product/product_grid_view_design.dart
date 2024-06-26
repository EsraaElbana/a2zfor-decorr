
import 'package:clint_store/common_widget/create_toast.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app_manager/local_data.dart';
import '../../client_Screens/product/product_design.dart';
import '../../cubit/application_state/client_states.dart';
import '../../cubit/cubits/client_cubit.dart';
import '../../models/product_model_client.dart';
import 'package:flutter/material.dart';

class CreatProductView extends StatelessWidget {
  final List<Product> productList;
  final ScrollPhysics? physics;
  final int? crossAxisCount;
  final double? mainAxisSpacing, crossAxisSpacing, childAspectRatio;
  final Axis? scrollDirection;

  CreatProductView({
    super.key,
    required this.productList,
    this.physics,
    this.crossAxisCount,
    this.mainAxisSpacing,
    this.crossAxisSpacing,
    this.childAspectRatio,
    this.scrollDirection,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: physics ?? NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: scrollDirection ?? Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 250,
        crossAxisCount: crossAxisCount ?? 2,
        mainAxisSpacing: mainAxisSpacing ?? 8.0,
        crossAxisSpacing: crossAxisSpacing ?? 8.0,
        // childAspectRatio: childAspectRatio ?? 0.75
      ),
      itemCount: productList.length,
      itemBuilder: (context, index) => BlocConsumer<ClientCubit, ClientStates>(
        builder: (BuildContext context, state) {
          ClientCubit clientCubit = ClientCubit.get(context);
          return CreatProduct(

            onTap: state is AddToCartLoading
                ? () {}
                : () {
                    clientCubit.addToCart(
                        productId: productList[index].id!, Quantity: 1);
                  },
            product: productList[index],
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
                errorMessage: "تمت إضافه المنتج الي السله", context: context);
          }
        },
      ),
    );
  }
}
