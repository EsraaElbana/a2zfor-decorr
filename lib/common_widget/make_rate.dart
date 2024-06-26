import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class CreatRate2 extends StatelessWidget {

  const CreatRate2({Key ?key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white70,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: RatingBar.builder(
          itemSize: 20,
          initialRating: 5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            size: 8,
            color:  Color(0xffFFAD33),
          ),
          onRatingUpdate: (rating) {},
          tapOnlyMode: true,
        ),
      ),
    );
  }
}