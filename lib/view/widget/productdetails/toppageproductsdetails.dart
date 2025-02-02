import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/productdetials_controller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/linkapi.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        Positioned(
          right: Get.width / 8,
          left: Get.width / 8,
          top: 50.0,
          child: Hero(
            tag: "${controller.itemsModel.itemId}",
            child: CachedNetworkImage(
                imageUrl:
                    "${AppLink.imageitems}/${controller.itemsModel.itemImage!}",
                height: 250,
                fit: BoxFit.fill),
          ),
        ),
      ],
    );
  }
}
