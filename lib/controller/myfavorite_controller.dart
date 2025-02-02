// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'package:tataboq_app/core/class/statusrequest.dart';
import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
import 'package:tataboq_app/core/services/services.dart';
import 'package:tataboq_app/data/datasource/remote/myfavorite_data.dart';
import 'package:tataboq_app/data/model/myfavorite.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  List<Data> data = []; // Use the `Data` class

  late StatusRequest statusRequest;
  Myservices myservices = Get.find();

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData
        .getData(myservices.sharedPreferences.getString("id")!);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Parse the JSON data into a list of `Data` objects
        data = (response['data'] as List)
            .map((item) => Data.fromJson(item))
            .toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteid) async {
    
    var response = await favoriteData.deleteData(favoriteid);

    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
