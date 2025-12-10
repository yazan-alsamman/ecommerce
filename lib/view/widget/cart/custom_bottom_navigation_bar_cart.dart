import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tataboq_app/controller/cart_controller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/view/widget/cart/buttomcart.dart';
import 'package:tataboq_app/view/widget/cart/custombuttoncoupon.dart';

class BottomNavigationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;
  final String totalPrice;
  final TextEditingController controllercoupon;
  final void Function() onApplyCoupon;
  const BottomNavigationBarCart(
      {super.key,
      required this.price,
      required this.discount,
      required this.totalPrice,
      required this.controllercoupon,
      required this.onApplyCoupon,
      required this.shipping});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
            builder: (controller) => controller.couponName == null
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              hintText: "Coupon Code",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textbutton: "Apply",
                            onPressed: onApplyCoupon,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Text(
                      "Coupon Name: ${controller.couponName!}",
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Price",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        price,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "discount",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "$discount",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "shipping",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "$shipping",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Total Price",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        totalPrice,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomButtonCart(
            textbutton: "order",
            onPressed: () {
              //  Get.toNamed(AppRoute.checkOut);
              controller.goToPageCheckout();
            },
          ),
        ],
      ),
    );
  }
}
