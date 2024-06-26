import 'package:flutter/material.dart';

import '../app_manager/local_data.dart';



class BlackTitle {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 14,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Color(0xff154C61),
        );
  }
}


class BlackLabel {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 12,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
      color: Color(0xff154C61),

    );
  }
}

class SmallBlackLabel {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 10,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );
  }
}

class VeryBlackTitle {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 16,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );
  }
}

class WhiteTitle {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 14,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
  }
}

class VeryWhiteTitle {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 16,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
  }
}

class WhiteLabel {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 12,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
  }
}

class VerySmallWhiteLabel {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 7,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
  }
}

class MainTitle {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 14,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: mainColor,
        );
  }
}

class MainLabel {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 12,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: mainColor,
        );
  }
}

class GreyTitle {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 14,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        );
  }
}

class GreyLabel {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 11,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        );
  }
}

class RedLabel {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
          fontSize: 12,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          color: Colors.red,
        );
  }
}
