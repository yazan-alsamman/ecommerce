import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:tataboq_app/controller/orders/pending_controller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/data/model/ordermodel.dart';
import 'package:tataboq_app/view/local%20notification/localnotification_services.dart';

class CardOrderList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrderList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.01),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Number and Date
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Order Number: #${listdata.orderId}",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  Jiffy.parse(listdata.orderDatetime!).fromNow(),
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontFamily: "Cairo",
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ],
            ),
            Divider(thickness: 1.5),
            // Order Details
            ResponsiveText("Order Type : ${controller.printOrderType(listdata.orderType!.toString())}", screenWidth),
            ResponsiveText("Order Price : ${listdata.orderPrice}\$", screenWidth),
            ResponsiveText("Delivery Price : ${listdata.orderPricedelivery}\$", screenWidth),
            ResponsiveText("Payment Method : ${controller.printPaymentMethod(listdata.orderPaymentmethod!.toString())}", screenWidth),
            ResponsiveText("Order Status : ${controller.printOrderStatus(listdata.orderStatus!.toString())}", screenWidth),
            Divider(thickness: 1.5),
            // Total Price and Buttons
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Total Price : ${listdata.orderTotalprice}\$",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Flexible(
                  child: MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.orderdetails, arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    minWidth: screenWidth * 0.25,
                    height: screenHeight * 0.05,
                    child: Text(
                      "Details",
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                if (listdata.orderStatus == 0)
                  Flexible(
                    child: MaterialButton(
                      onPressed: () {
                        AwesomeDialog(
                          context: Get.context!,
                          dialogType: DialogType.question,
                          animType: AnimType.rightSlide,
                          title: 'Delete',
                          desc: 'Are You sure You Want To Delete This Order',
                          btnCancelOnPress: () async {
                            controller.deleteOrder(listdata.orderId!.toString());
                            Random random = Random();
                            await showNotification(
                              id: random.nextInt(100),
                              title: 'Deleted',
                              body: 'Your Order was Deleted Successfully',
                            );
                          },
                          btnCancelColor: AppColor.thirdColor,
                          btnOkColor: AppColor.fourthColor,
                          btnCancelText: "Ok",
                          btnOkOnPress: () {},
                          btnOkText: "Cancel",
                        ).show();
                      },
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      minWidth: screenWidth * 0.25,
                      height: screenHeight * 0.05,
                      child: Text(
                        "Delete",
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Widget for Responsive Text
class ResponsiveText extends StatelessWidget {
  final String text;
  final double screenWidth;

  const ResponsiveText(this.text, this.screenWidth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: screenWidth * 0.04),
    );
  }
}