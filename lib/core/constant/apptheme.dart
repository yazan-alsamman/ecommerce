import 'package:flutter/material.dart';
import 'package:tataboq_app/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
    bodyText1: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.w400,
        fontSize: 18),
    bodyText2: TextStyle(
        height: 2,
        color: AppColor.grey,
        //fontWeight: FontWeight.w400,
        fontSize: 14),
  ),
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
        
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
    bodyText1: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.w400,
        fontSize: 18),
    bodyText2: TextStyle(
        height: 2,
        color: AppColor.grey,
        //fontWeight: FontWeight.w400,
        fontSize: 14),
  ),
);

ThemeData themeFrench = ThemeData(
  fontFamily: "Open_Sans",
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
    bodyText1: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.w400,
        fontSize: 18),
    bodyText2: TextStyle(
        height: 2,
        color: AppColor.grey,
        //fontWeight: FontWeight.w400,
        fontSize: 14),
  ),
);
