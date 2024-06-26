import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilities/text_style.dart';

class CreatNoAvailableData extends StatelessWidget {
final String? title;
final TextStyle? titleStyle;

  const CreatNoAvailableData({super.key, this.title,  this.titleStyle});
  @override
  Widget build(BuildContext context) {
    return   Center(
      child:
      Text(title??
        "عفوا لا يوجد بيانات متاحه الان !!!!",
        style: titleStyle??BlackTitle
            .display5(context)
            .copyWith(
            color:
            Colors.red),
      )
    );
  }
}
