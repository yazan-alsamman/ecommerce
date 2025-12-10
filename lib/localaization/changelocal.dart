import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/core/constant/apptheme.dart';
import 'package:tataboq_app/services/services.dart';

class LocaleController extends GetxController {
  Locale? language;
  Myservices myServices = Get.find();
  ThemeData appTheme = themeEnglish;
  changelang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "Ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedprefLang = myServices.sharedPreferences.getString("lang");
    if (sharedprefLang == "Ar") {
      language = const Locale("Ar");
      appTheme = themeArabic;
    } else if (sharedprefLang == "En") {
      language = const Locale("En");
      appTheme = themeEnglish;
    } else if (sharedprefLang == "Fr") {
      language = const Locale("Fr");
      appTheme = themeFrench;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
