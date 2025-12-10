import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tataboq_app/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  appBarTheme: AppBarTheme(
    centerTitle: T,
    iconTheme: const IconThemeData(
      color: AppColor.primaryColor,
    ),
    titleTextStyle: const TextStyle(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo",
        fontSize: 25),
    backgroundColor: Colors.grey[50],
  ),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: AppColor.primaryColor),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.w400,
        fontSize: 18),
    bodyMedium: TextStyle(
        height: 2,
        color: AppColor.grey,
        //fontWeight: FontWeight.w400,
        fontSize: 14),
  ),
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.w400,
        fontSize: 18),
    bodyMedium: TextStyle(
        height: 2,
        color: AppColor.grey,
        //fontWeight: FontWeight.w400,
        fontSize: 14),
  ),
);

ThemeData themeFrench = ThemeData(
  fontFamily: "Open_Sans",
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
    bodyLarge: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.w400,
        fontSize: 18),
    bodyMedium: TextStyle(
        height: 2,
        color: AppColor.grey,
        //fontWeight: FontWeight.w400,
        fontSize: 14),
  ),
);
