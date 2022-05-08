import 'package:flutter/material.dart';

class Constants {
  static Color mainColor = Colors.blue[900]!;
  static Color accentColor = const Color(0xff6EDCDA);
  //Color(0xff0d47a1)
  static Color vLightBlue = Colors.blue[50]!;
  static Color lightGrey = Colors.grey[300]!;
  static Color darkGrey = Colors.grey[900]!;
  static Color lightRed = Colors.red[200]!;
  static Color scaffoldBackgroundColor = Colors.blue[50]!;

  static ScrollPhysics mainScrollPhysics = const BouncingScrollPhysics(
    parent: AlwaysScrollableScrollPhysics(),
  );

  static BorderRadius topLeftRightBorderRadius = const BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
  );

  static LinearGradient blueGreenGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF330867),
      Color(0xFF30CFD0),
    ],
  );

  static LinearGradient blueParpleGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFb721ff),
      Color(0xFF21d4fd),
    ],
  );
  static LinearGradient blueParpleGradientB = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFb490ca),
      Color(0xFF5ee7df),
    ],
  );

  static LinearGradient darkBlueGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1e3c72),
      Color(0xFF2a5298),
    ],
  );

  static LinearGradient darkBlueLightBlueGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff0d47a1),
      Color(0xff6EDCDA),
    ],
  );

  static LinearGradient whiteGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFdfe9f3),
      Color(0xFFffffff),
    ],
  );

  static LinearGradient lightBlueLightPinkGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFace0f9),
      Color(0xFFfff1eb),
    ],
  );

  static LinearGradient darkGreyGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Colors.grey[900]!,
      Colors.grey[800]!,
    ],
  );
  static double hPadding = 24;
  static double sPadding = 12;

  static InputDecoration underLineInputDecoration({
    String? lableText,
    Widget? icon,
    String? hintText,
  }) {
    return InputDecoration(
      labelText: lableText,
      hintText: hintText,
      icon: icon,
      enabledBorder: const UnderlineInputBorder(),
      focusedBorder: const UnderlineInputBorder(),
    );
  }

  static InputDecoration outlineInputDecoration(
      {EdgeInsets? contenetPadding, String? hintText}) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: contenetPadding ?? const EdgeInsets.all(8),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(6),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(6),
      ),
      errorStyle: const TextStyle(height: 0, fontSize: 0),
    );
  }
}

String reviewsRef = 'reviews';
String commentsRef = 'comments';
String usersRef = 'users';
String likesRef = 'likes';
