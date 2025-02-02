import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/productdetials_controller.dart';
import 'package:tataboq_app/core/constant/color.dart';

class SubItemsList extends GetView<ProductDetailsControllerImp> {
  const SubItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subitems.length,
          (index) => Container(
            margin: const EdgeInsets.only(
              right: 10,
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: controller.subitems[index]['active'] == "1"
                  ? AppColor.fourthColor
                  : Colors.white,
              border: Border.all(
                color: AppColor.fourthColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 60,
            width: 90,
            child: Text(
              controller.subitems[index]['name'],
              style: TextStyle(
                  color: controller.subitems[index]['active'] == "1"
                      ? Colors.white
                      : AppColor.fourthColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
