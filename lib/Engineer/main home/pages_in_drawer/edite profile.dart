import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class EditProfile extends StatelessWidget {

  final TextEditingController controller;
  EditProfile(this.text,this.controller);

  String? text;

  @override
  Widget build(BuildContext context) {

    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Padding(
      padding: EdgeInsets.fromLTRB(20 * fem, 12 * fem, 20 * fem, 12 * fem),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(text!,
            style: TextStyle(
              fontSize: 16 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.2125 * ffem / fem,
              color: const Color(0xff000000),
            )),
        SizedBox(
          height: 7 * ffem,
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: TextField(
            controller: controller,
            //controller: TextEditingController(),
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              filled: true,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD6D6D6)),
              ),
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ),
        ),
      ]),
    );
  }
}
