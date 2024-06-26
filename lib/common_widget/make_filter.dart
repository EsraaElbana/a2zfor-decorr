
import 'package:flutter/material.dart';

import '../app_manager/local_data.dart';
import '../utilities/routes_manager.dart';
import '../utilities/text_style.dart';
import 'make_button.dart';
class BottomSheetContent {
  double salaryRangeFrom=100,salaryRangeTo=3000;
  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          )),

      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 19,),
                creatDetails(context:context,title:"Filter",fontSize: 18,icon: Icons.cancel,onTap: (){RoutesManager.pop(context);} ),

                creatDetails(context:context,title:"Wardrobes",textColor:  Color(0xff6A6D70)),
                creatDetails(context:context,title:"Beds",textColor:  Color(0xff6A6D70)),
                creatDetails(context:context,title:"Dressers % Drawers",textColor:  Color(0xff6A6D70)),
                creatDetails(context:context,title:"Bedroom Ensembles",textColor:  Color(0xff6A6D70)),
                SizedBox(height: 10,),
                creatDetails(context:context,title:"Color Family",fontSize: 18,),
                Container(
                  height: 30,
                  child:   ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index)=>Container(
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.amberAccent,
                        ),
                      )),
                ),
                SizedBox(height: 10,),
                creatDetails(context:context,title:"Price" ),
                creatDetails(context:context,title:"Discount Range",),
                RangeSlider(
                  activeColor: mainColor,
                  inactiveColor: greyColor,
                  values: RangeValues(salaryRangeFrom,salaryRangeTo),
                  min: 0,
                  max: 10000,
                  onChanged: (RangeValues values) {
// setState(() {
// salaryRangeFrom=values.start;
// salaryRangeTo=values.end;
// });
                  },
                ),

                MakeButton(title: "Apply Filter Now", onTap: (){},width: getSize(context: context).width*0.5,topMargin: 20,)


              ],
            ),
          ),
        );
      },
    );
  }
  Widget creatDetails({
    Color? textColor,
    required BuildContext context,required String title,double? fontSize,IconData ?icon,void Function()? onTap}){
    return   InkWell(
      onTap:onTap ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style:

          BlackTitle.display5(context).copyWith(fontSize: fontSize??14,color:textColor??Colors.black ),),
          Icon(icon??Icons.arrow_forward_ios,color: Color(0xff6A6D70),size: 16,)
        ],),
    );
  }
}