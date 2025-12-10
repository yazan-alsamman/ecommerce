import 'package:get/get.dart';
import 'package:tataboq_app/core/class/statusrequest.dart';
import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
import 'package:tataboq_app/data/datasource/remote/orders/details_data.dart';
import 'package:tataboq_app/data/model/cartmodel.dart';
import 'package:tataboq_app/data/model/ordermodel.dart';

class OrderDetailsController extends GetxController {
  late OrdersModel ordersModel;
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());

  List<CartModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await orderDetailsData.getData(ordersModel.orderId!.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getData();
    super.onInit();
  }
}
