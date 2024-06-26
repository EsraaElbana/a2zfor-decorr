import 'package:flutter/material.dart';

class CreatLoading extends StatelessWidget{
  final double? height;

  const CreatLoading({super.key,  this.height});
  @override
  Widget build(BuildContext context) {
       return Row(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
         Container(
           // height: height??150,
           // height: 80,
           child: Center(
             child: CircularProgressIndicator(
               color : Colors.blue,

             ),
           ),
         )
       ],);
  }


}