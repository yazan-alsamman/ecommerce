import 'package:get/get.dart';
import 'package:tataboq_app/core/class/statusrequest.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
import 'package:tataboq_app/core/services/services.dart';
import 'package:tataboq_app/data/datasource/remote/sales_data.dart';

abstract class SalesController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, String categoryid);
}

class SalesControllerImp extends SalesController {
  Myservices myservices = Get.find();
  String? username;
  SalesData salesData = SalesData(Get.find());

  //List data = [];
  List categories = [];
  List items = [];

  late StatusRequest statusRequest;
  @override
  initialData() {
    username = myservices.sharedPreferences.getString("username");
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await salesData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['items']['data']);
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
}
