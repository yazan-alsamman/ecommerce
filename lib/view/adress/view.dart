import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/adress/view_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/data/model/adressmodel.dart';

class AdressView extends StatelessWidget {
  const AdressView({super.key});

  @override
  Widget build(BuildContext context) {
    AdressViewController controller = Get.put(AdressViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adress'),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        onPressed: () {
          Get.toNamed(AppRoute.adressadd);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<AdressViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardAdress(
                  addressModel: controller.data[index],
                  onDelete: () {
                    controller.deleteAdress(
                        controller.data[index].adressId!.toString());
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardAdress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function() onDelete;
  const CardAdress(
      {super.key, required this.addressModel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(addressModel.adressName!),
          subtitle:
              Text("${addressModel.adressCity!} ${addressModel.adressStreet!}"),
          trailing: IconButton(
              onPressed: onDelete, icon: Icon(Icons.delete_outline_outlined)),
        ),
      ),
    );
  }
}
