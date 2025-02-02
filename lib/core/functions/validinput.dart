import 'package:get/get.dart';

validInput(String val, int min, int max, type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "46".tr;
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Invalid Email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Invalid phone number";
    }
  }
  if (val.isEmpty) {
    return "This field Can not be Empty";
  }
  if (val.length < min) {
    return "${"50".tr}$min";
  }
  if (val.length > max) {
    return "${"51".tr}$max";
  }
}
