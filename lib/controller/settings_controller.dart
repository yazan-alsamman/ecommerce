import 'package:get/get.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/core/services/services.dart';

class SettingsController extends GetxController {
  Myservices myservices = Get.find();
  logout() {
    myservices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
