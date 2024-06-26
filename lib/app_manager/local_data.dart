import 'package:flutter/material.dart';

const String baseUrl = "https://a2z-render.onrender.com/";
const String serverError = "Failed to connect to the server";
const Color mainColor2 = Color(0xff4E563E);
const Color mainColor = Color(0xff5F694C);
const Color mainColor3 = Color(0xff297A7A);
const Color thirdColor = Color(0xff695A4D);

////////////////////////////////////////////////////////////////////////////////////////

// هنمسح الصورتين وهنبدل local data و هنرجع لينك السدحان مكانه  و الجيت هاب

const Color whiteColor = Color(0xffFFFFFF);
const Color greyColor = Color(0xffCBCBCB);
const String noImage =
    "https://st4.depositphotos.com/14953852/22772/v/600/depositphotos_227725020-stock-illustration-image-available-icon-flat-vector.jpg";

Size getSize({
  context,
}) {
  Size size = MediaQuery.of(context).size;
  return size;
}

/////// vvvip increase heaight of text field
// Container(
// margin: EdgeInsets.all(12),
// height: 7 * 24.0,
// child: TextField(
// maxLines: 7,
// decoration: InputDecoration(
// hintText: "اكتب تفاصيل المنتج",
// hintStyle: TextStyle(color: Colors.white, fontSize: 18),
// fillColor: secColor,
// filled: true,
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(color: mainColor, width: 5.0),
// borderRadius: BorderRadius.all(Radius.circular(13.0))),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: mainColor, width: 5.0),
// borderRadius: BorderRadius.all(Radius.circular(13.0))),
// ),
// ),
// ),
///////////////////////////////////////////
// ListView.builder(
// shrinkWrap: true,
// scrollDirection: Axis.horizontal,
// padding: EdgeInsets.symmetric(horizontal:3),
// physics:  NeverScrollableScrollPhysics(),
// itemCount: 5,
// itemBuilder: (context,index)=>

// crossAxisCount: 3,
// crossAxisSpacing: 2.0,
// mainAxisSpacing: 7.0,
// childAspectRatio: 0.40,

// FaIcon(FontAwesomeIcons.gamepad),
//

// bottom: false, in safe areae
//extendBody: true, in scafo

// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// MembershipTypeScreen()));

//static const route="MyAccountScreen";
