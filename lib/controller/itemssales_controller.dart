import 'package:get/get.dart';
import 'package:tataboq_app/core/class/statusrequest.dart';
import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
import 'package:tataboq_app/core/services/services.dart';
import 'package:tataboq_app/data/datasource/remote/itemsdata.dart';

abstract class ItemsSalesController extends GetxController {
  intialData();
  changeCat(int val, String catval);
  getItems(String categoryid);
}

class ItemsSalesControllerImp extends ItemsSalesController {
  List categories = [];
  String? catid;

  int? selectedcat;

  ItemsData testData = ItemsData(Get.find());

  List data = [];

  late StatusRequest statusRequest;
    Myservices myservices = Get.find();

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  intialData() {
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
}
