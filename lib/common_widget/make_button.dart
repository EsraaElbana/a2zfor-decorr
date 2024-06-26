
import 'package:flutter/material.dart';

import '../app_manager/local_data.dart';
import '../utilities/text_style.dart';

class MakeButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final TextStyle? titleStyle;
  final double? topMargin, bottomMargin, height, width, borderRadius;
  final Color? backGroundColor;

  const MakeButton(
      {super.key,
        required this.title,
        required this.onTap,
        this.titleStyle,
        this.topMargin,
        this.bottomMargin,
        this.height,
        this.width,
        this.borderRadius,
        this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin:
        EdgeInsets.only(top: topMargin ?? 5.0, bottom: bottomMargin ?? 5.0),
        height: height ?? getSize(context: context).height * 0.05,
        width: width ?? double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backGroundColor ?? Color(0xff070F2B),
            borderRadius: BorderRadius.circular(borderRadius ?? 10)),
        child: Text(
          title,
          style: titleStyle ?? WhiteTitle.display5(context),
        ),
      ),
    );
  }
}