import 'package:flutter/cupertino.dart';

class Sizes {
  //height definition
  static double height(BuildContext context, double size) {
    return MediaQuery.of(context).size.height * size;
  }

  // width definition
  static double width(BuildContext context, double size) {
    return MediaQuery.of(context).size.width * size;
  }
}
