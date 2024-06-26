import 'package:clint_store/cubit/cubits/client_cubit.dart';
import 'package:clint_store/utilities/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_manager/local_data.dart';

import '../client_Screens/cart_screen/cart.dart';

import '../utilities/text_style.dart';

class CreatAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Size preferredSize;
  final bool hasBackButton;
  final bool hasDrawer;
  final bool hasCart;
  final void Function() onDrawerPressed;
  final bool hasTitle;

  CreatAppBar({
    Key? key,
    required this.hasTitle,
    required this.hasBackButton,
    required this.title,
    required this.onDrawerPressed,
    required this.hasDrawer, required this.hasCart,
  })  : preferredSize = Size.fromHeight(53.0),
        super(key: key);

  @override
  State<CreatAppBar> createState() => _CreatAppBarState();
}

class _CreatAppBarState extends State<CreatAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          widget.hasTitle == true ? widget.title : "",
          style: GreyTitle.display5(context).copyWith(
            color: Color(0xff000000),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        primary: true,
        automaticallyImplyLeading: true,
        leading: widget.hasDrawer == true
            ? Row(
                children: [
                  Container(
                    width: 50,
                    child: creatIcon(
                        onTap: widget.onDrawerPressed,
                        child: Icon(
                          Icons.menu,
                          color: Color(0xff000000),
                        )),
                  ),
                ],
              )
            : SizedBox(),
        actions: [
      Row(
            children: [
              widget. hasCart==true?
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CartScreen()));
                    },
                  ),
                  BlocProvider.of<ClientCubit>(context).allCartProducts.isEmpty
                      ? SizedBox()
                      : Positioned(
                          top: -9,
                          left: 12,
                          child: Container(
                            // color: Colors.yellow,
                            height: 30,
                            alignment: Alignment.center,
                            child: Text(
                              // "1",
                              "${BlocProvider.of<ClientCubit>(context).allCartProducts.length}",
                              style: BlackTitle.display5(context),
                            ),
                          ),
                        )
                ],
              ):SizedBox(),
              widget.hasBackButton == true
                  ? Container(
                      width: 50,
                      child: creatIcon(
                          onTap: () {
                            RoutesManager.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Color(0xff000000),
                          )),
                    )
                  : SizedBox(),
            ],
          ),
        ]);
  }

  Widget creatIcon({required void Function() onTap, required Widget child}) {
    return InkWell(
        onTap: onTap,
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal:5),
          width: getSize(context: context).width * 0.05,
          // color: Colors.blue,
          child: child,
        ));
  }
}
