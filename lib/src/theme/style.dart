import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: CustomColors.bckgrndColor,
      primaryIconTheme: const IconThemeData(
        color: CustomColors.appBarTextColor,
        opacity: 1,
      ),
      appBarTheme: AppBarTheme(
        color: CustomColors.appBarColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: CustomColors.appBarTextColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "HelveticaNeue",
        ),
        actionsIconTheme: IconThemeData(
          color: CustomColors.appBarTextColor,
          opacity: 1,
          size: 26.r,
        ),
        iconTheme: IconThemeData(
          color: CustomColors.appBarLeadingIconColor,
          opacity: 1,
          size: 25.r,
        ),
      ),
      primaryTextTheme: const TextTheme(
        headline1: TextStyle(
          color: CustomColors.h1TextColor,
        ),
      ),
      fontFamily: "HelveticaNeue",
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }
}

ThemeData appThemeLight() {
  return ThemeData(
    primaryColor: Colors.white,
    hintColor: Colors.white,
    dividerColor: Colors.white,
    scaffoldBackgroundColor: Colors.black,
    canvasColor: Colors.black,
  );
}
