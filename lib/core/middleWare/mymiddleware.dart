// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/core/services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  Myservices myservices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString("step") == "2") {
      return const  RouteSettings(name: AppRoute.homepage);
    }
    if (myservices.sharedPreferences.getString("step") == "1") {
      return const  RouteSettings(name: AppRoute.login);
    }

    
  }
}
