import 'package:flutter/cupertino.dart';

class Dimensions {
  static double size({required BuildContext context, required value}) {
    final screenHight = MediaQuery.of(context).size.height;
    final result = screenHight / value;
    return screenHight / result;
  }

  static double fromHeight({
    required BuildContext context,
    required double amount,
  }) {
    return MediaQuery.of(context).size.height * amount;
  }

  static double fromWidth({
    required BuildContext context,
    required double amount,
  }) {
    return MediaQuery.of(context).size.width * amount;
  }
}
