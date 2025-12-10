import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/core/class/statusrequest.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
import 'package:tataboq_app/core/services/services.dart';
import 'package:tataboq_app/data/datasource/remote/cart_data.dart';
import 'package:tataboq_app/data/model/cartmodel.dart';
import 'package:tataboq_app/data/model/couponmodel.dart';

class CartController extends GetxController {
  TextEditingController? controllercoupon;
  CartData cartData = CartData(Get.find());
  int? discountCoupon = 0;
  String? couponName;
  String? couponId;

  late StatusRequest statusRequest;
  CouponModel? couponModel;
  Myservices myservices = Get.find();
  List<CartModel> data = [];
  double priceorder = 0.0;
  int totalcountitem = 0;
  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "notification",
          messageText: const Text("Added To Cart"),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(
        myservices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "notification",
          messageText: const Text("Deleted from Cart"),
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("Warning", "Your Cart is Empty");
    Get.toNamed(AppRoute.checkOut, arguments: {
      "couponid": couponId ?? "0".toString(),
      "priceorder": priceorder.toString(),
      "discountcoupon": discountCoupon.toString(),
    });
  }

  getTotalPrice() {
    return (priceorder - priceorder * discountCoupon! / 100);
  }

  resetVarCart() {
    totalcountitem = 0;
    priceorder = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await cartData.viewCart(myservices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataResponse = response['datacart']['data'];
          Map dataResponseCountPrice = response['countprice'];
          data.clear();
          data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
          totalcountitem = int.parse(dataResponseCountPrice['totalcount']);
          priceorder =
              double.parse(dataResponseCountPrice['totalprice'].toString());
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllercoupon!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountCoupon = int.parse(couponModel!.couponDiscount.toString());
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId.toString();
      } else {
        //statusRequest = StatusRequest.failure;
        discountCoupon = 0;
        couponName = null;
        couponId = null;
        Get.snackbar("Failed", "Invalid Coupon");
      }
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
