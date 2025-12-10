import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/core/class/statusrequest.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
import 'package:tataboq_app/core/services/services.dart';
import 'package:tataboq_app/data/datasource/remote/home_data.dart';
import 'package:tataboq_app/data/model/itemsmodel.dart';

abstract class HomeController extends searchMixController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  Myservices myservices = Get.find();
  String? username;
  String? id;
  String? lang;
  String titleHomeCart = "";
  String bodyHomeCart = "";
  String deliveryTime = "";
  HomeData homeData = HomeData(Get.find());

  List settingdata = [];
  List categories = [];
  List items = [];

  @override
  initialData() {
    lang = myservices.sharedPreferences.getString("lang");
    username = myservices.sharedPreferences.getString("username");
    id = myservices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settingdata.addAll(response['setting']['data']);
        titleHomeCart = settingdata[0]["setting_titleone"];
        bodyHomeCart = settingdata[0]["setting_bodyhome"];
        deliveryTime = settingdata[0]['setting_deliverytime'].toString();
        myservices.sharedPreferences.setString("deliverytime", deliveryTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid,
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  }
}

class searchMixController extends GetxController {
  late StatusRequest statusRequest;
  HomeData homeData = HomeData(Get.find());
  List<ItemsModel> listdata = [];

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responseData = response['data'];
        listdata.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  TextEditingController? search;
  bool isSearch = false;

  checkSearch(val) {
    statusRequest = StatusRequest.none;
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }
}
