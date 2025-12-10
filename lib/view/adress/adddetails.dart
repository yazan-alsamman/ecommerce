import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/adress/addparttwo_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/shared/custombutton.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextFormAuth.dart';

class AdressAddDetails extends StatelessWidget {
  const AdressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AdressAddDetailsController controller =
        Get.put(AdressAddDetailsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Address Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: GetBuilder<AdressAddDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                CustomTextFormAuth(
                    hintText: "Enter your city",
                    labelText: "city",
                    iconData: Icons.location_city_outlined,
                    mycontroller: controller.city,
                    valid: (val) {},
                    isNumber: false),
                CustomTextFormAuth(
                    hintText: "Enter your steer",
                    labelText: "street",
                    iconData: Icons.streetview_outlined,
                    mycontroller: controller.street,
                    valid: (val) {},
                    isNumber: false),
                CustomTextFormAuth(
                    hintText: "name",
                    labelText: "name",
                    iconData: Icons.near_me,
                    mycontroller: controller.name,
                    valid: (val) {},
                    isNumber: false),
                CustomBotton(
                  text: "Add",
                  onPressed: () {
                    controller.AddAdress();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}