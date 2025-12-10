import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/checkout_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/constant/imageasset.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/view/widget/checkout/carddeliverytype.dart';
import 'package:tataboq_app/view/widget/checkout/cardpaymentmethod.dart';
import 'package:tataboq_app/view/widget/checkout/cardshippingadress.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("CheckOut"),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secondColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text(
              "Checkout",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ),
        body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const Text(
                    "Choose payment Method",
                    style: TextStyle(
                        color: AppColor.secondColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  InkWell(
                    onTap: () {
                      controller.choosePaymentMethod("0"); //0=>cash
                    },
                    child: CardPaymentMethodCheckout(
                      title: "Cach On Delivery",
                      isActive: controller.paymentMethod == "0" ? true : false,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      controller.choosePaymentMethod("1"); //1=>cart payment
                    },
                    child: CardPaymentMethodCheckout(
                      title: "Payments Card",
                      isActive: controller.paymentMethod == "1" ? true : false,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Choose Delivery type",
                    style: TextStyle(
                        color: AppColor.secondColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.chooseDeliveryType("0"); //0=>Delivery
                        },
                        child: CardDeliveryTypeCheckout(
                          imagename: AppImageAsset.deliveryImage2,
                          title: "Delivery",
                          isActive:
                              controller.deliveryType == "0" ? true : false,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.chooseDeliveryType("1"); //1=>recive
                        },
                        child: CardDeliveryTypeCheckout(
                          imagename: AppImageAsset.driveThruImage,
                          title: "Drive Thru",
                          isActive:
                              controller.deliveryType == "1" ? true : false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (controller.deliveryType == "0")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.dataaddress.isNotEmpty)
                          const Text(
                            "Choose Delivery Adress",
                            style: TextStyle(
                                color: AppColor.secondColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        if (controller.dataaddress.isEmpty)
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.adressadd);
                            },
                            child: Container(
                              color: AppColor.primaryColor,
                              child: const Center(
                                  child: Text(
                                "Please Add Your Address",
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                          controller.dataaddress.length,
                          (index) => InkWell(
                            onTap: () {
                              controller.chooseShippingAddress(controller
                                  .dataaddress[index].adressId!
                                  .toString());
                            },
                            child: CardShippingAdressChekout(
                                title:
                                    "${controller.dataaddress[index].adressName}",
                                body:
                                    "${controller.dataaddress[index].adressName} ${controller.dataaddress[index].adressCity} ${controller.dataaddress[index].adressStreet}",
                                isActive: controller.addressid ==
                                        controller.dataaddress[index].adressId
                                            .toString()
                                    ? true
                                    : false),
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
