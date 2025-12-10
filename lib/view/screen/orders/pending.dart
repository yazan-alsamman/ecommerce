import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/orders/pending_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/view/widget/orders/orderlistcard.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersPendingController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => CardOrderList(
                listdata: controller.data[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
