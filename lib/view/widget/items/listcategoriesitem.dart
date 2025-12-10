import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/items_controller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/data/model/categoriesmodel.dart';

class ListCategoriesItem extends GetView<ItemsControllerImp> {
  const ListCategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    ItemsControllerImp controller = Get.put(ItemsControllerImp());

    return SizedBox(
      height: screenHeight * 0.12, // Responsive height
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.03, // Responsive spacing
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                Categoriesmodel.fromJson(controller.categories[index]),
            screenWidth: screenWidth, // Pass screen width for dynamic sizing
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final Categoriesmodel categoriesModel;
  final int? i;
  final double screenWidth; // Add screen width as a parameter

  const Categories({
    super.key,
    required this.i,
    required this.categoriesModel,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<ItemsControllerImp>().changeCat(
          i!,
          categoriesModel.categorieId.toString(),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03, // Responsive padding
                vertical: screenWidth * 0.015,
              ),
              decoration: controller.selectedcat == i
                  ? BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2.5, // Responsive border width
                          color: AppColor.primaryColor,
                        ),
                      ),
                    )
                  : null,
              child: Text(
                "${categoriesModel.cetegorieName}",
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  color: controller.selectedcat == i
                      ? AppColor.primaryColor // Highlight selected category
                      : AppColor.grey2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
