import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/core/class/statusrequest.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
import 'package:tataboq_app/core/services/services.dart';
import 'package:tataboq_app/data/datasource/remote/adress_data.dart';

class AdressAddDetailsController extends GetxController {
  AdressData adressData = AdressData(Get.find());

  Myservices myservices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  String? lat;
  String? long;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  void initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  Future<void> AddAdress() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await adressData.addData(
      myservices.sharedPreferences.getString("id")!,
      name!.text,
      city!.text,
      street!.text,
      lat!,
      long!,
    );

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.cart);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
