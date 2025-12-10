import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:tataboq_app/core/class/statusrequest.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
import 'package:tataboq_app/core/services/services.dart';
import 'package:tataboq_app/data/datasource/remote/orders/pending_data.dart';
import 'package:tataboq_app/data/model/ordermodel.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class OrdersPendingController extends GetxController {
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;
  Myservices myservices = Get.find();
  String printOrderType(String val) {
    if (val == "0") {
      return "Delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash on Delivery";
    } else {
      return "Card Payment";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Await Approval";
    } else if (val == "1") {
      return "Preparing";
    } else if (val == "2") {
      return "Ready to Picked Up by Delivery Man";
    } else if (val == "3") {
      return "on the way";
    } else {
      return "Archived";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await ordersPendingData
        .getData(myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteOrder(String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await ordersPendingData.deleteData(orderid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getOrders();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
