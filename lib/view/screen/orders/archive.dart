import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/orders/archived_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/view/widget/orders/orderslistarchived.dart';

class OrdersArchivedView extends StatelessWidget {
  const OrdersArchivedView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchivedController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersArchivedController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => CardOrderListArchived(
                      listdata: controller.data[index],
                    ),
                  ),
                )),
      ),
    );
  }
}
