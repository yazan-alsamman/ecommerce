import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/home_controller.dart';
import 'package:tataboq_app/core/class/statusrequest.dart';
import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
import 'package:tataboq_app/core/services/services.dart';
import 'package:tataboq_app/data/datasource/remote/itemsdata.dart';
import 'package:tataboq_app/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends searchMixController {
  List categories = [];
  String? catid;

  int? selectedcat;

  ItemsData testData = ItemsData(Get.find());
  String deliverytime = "";
  List data = [];

  late StatusRequest statusRequest;
  Myservices myservices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();

    intialData();
    super.onInit();
  }

  @override
  intialData() {
    deliverytime = myservices.sharedPreferences.getString("deliverytime")!;
    categories = Get.arguments['categories'];
    selectedcat = Get.arguments['selectedcat'];
    catid = Get.arguments['catid'];

    getItems(catid!);
  }

  @override
  changeCat(val, catval) {
    selectedcat = val;
    catid = catval;
    getItems(catval);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData(
        categoryid, myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}
