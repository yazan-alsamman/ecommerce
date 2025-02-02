// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/items_controller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/data/model/categoriesmodel.dart';

class ListCategoriesItem extends GetView<ItemsControllerImp> {
  const ListCategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return SizedBox(
      height: 100,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
              i: index,
              categoriesModel:
                  Categoriesmodel.fromJson(controller.categories[index]));
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final Categoriesmodel categoriesModel;
  final int? i;
  const Categories({super.key, required this.i, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(
        //   controller.categories,i!
        // );
        controller.changeCat(i!, categoriesModel.categorieId.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
            builder: (controller) => Container(
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 5),
              decoration: controller.selectedcat == i
                  ? BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 3, color: AppColor.primaryColor),
                      ),
                    )
                  : null,
              child: Text(
                "${categoriesModel.cetegorieName}",
                style: TextStyle(fontSize: 20, color: AppColor.grey2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
