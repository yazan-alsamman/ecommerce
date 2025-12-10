import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/orders/details_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/view/widget/map/map.dart';
import 'package:tataboq_app/view/widget/map/ordderlocation.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GetBuilder<OrderDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(
                              children: [
                                Text(
                                  "Categorie",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Amount",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Price",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(
                                children: [
                                  Text(
                                    "${controller.data[index].itemName}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text("${controller.data[index].countitems}",
                                      textAlign: TextAlign.center),
                                  Text("${controller.data[index].itemPrice}",
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            "price: ${controller.ordersModel.orderTotalprice}\$",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.ordersModel.orderType == 0)
                  Card(
                    child: Container(
                      child: ListTile(
                        title: Text(
                          "Delivery Adress",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("${controller.ordersModel.adressCity}"
                            " "
                            "${controller.ordersModel.adressStreet}"),
                      ),
                    ),
                  ),
                if (controller.ordersModel.orderType == 0)
                  Card(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 300,
                      width: double.infinity,
                      child: OrderLocation(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
