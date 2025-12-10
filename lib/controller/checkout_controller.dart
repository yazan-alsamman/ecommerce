import 'package:get/get.dart';
import 'package:tataboq_app/core/class/statusrequest.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
import 'package:tataboq_app/core/services/services.dart';
import 'package:tataboq_app/data/datasource/remote/adress_data.dart';
import 'package:tataboq_app/data/datasource/remote/checkout_data.dart';
import 'package:tataboq_app/data/model/adressmodel.dart';

class CheckoutController extends GetxController {
  AdressData adressData = Get.put(AdressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  Myservices myservices = Get.find();
  StatusRequest statusRequest = StatusRequest.success;
  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";
  late String couponId;
  late String priceorder;
  late String couponDiscount;

  List<AddressModel> dataaddress = [];
  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response =
        await adressData.getData(myservices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
        addressid = dataaddress[0].adressId.toString();
      } else {
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar(
          "Checkout Failed", "Please choose the payment Method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Checkout Failed", "Please choose the Delivery Type");
    }
    if (dataaddress.isEmpty) {
      return Get.snackbar(
          "Checkout Failed", "Please choose the Delivery Adress");
    }
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "userid": myservices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "ordertype": deliveryType.toString(),
      "pricedelivery": "10",
      "orderprice": priceorder.toString(),
      "couponid": couponId.toString(),
      "coupondiscount": couponDiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
    };
    var response = await checkoutData.checkout(data);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar("Success", "The order was registered");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Warnning", "Please Try Again");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponId = Get.arguments['couponid'].toString();
    priceorder = Get.arguments['priceorder'].toString();
    couponDiscount = Get.arguments['discountcoupon'].toString();

    getShippingAddress();
    super.onInit();
  }
}
