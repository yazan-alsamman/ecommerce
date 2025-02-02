// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/favorite_controller.dart';
import 'package:tataboq_app/controller/items_controller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/constant/imageasset.dart';
import 'package:tataboq_app/core/functions/translatedatabase.dart';
import 'package:tataboq_app/data/model/itemsmodel.dart';
import 'package:tataboq_app/linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  //final bool active;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${itemsModel.itemId}",
                      child: CachedNetworkImage(
                        imageUrl: AppLink.imageitems + itemsModel.itemImage!,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${translateDatabase(itemsModel.itemNameAr, itemsModel.itemName)}",
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rating 3.5"),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 22,
                          child: Row(
                            children: [
                              ...List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    itemsModel.itemDiscount != 0
                        ? Column(
                            children: [
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "${itemsModel.itemPrice}\$",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: AppColor.fourthColor,
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${itemsModel.itemspricediscount!}\$",
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "sans"),
                                  ),
                                  GetBuilder<FavoriteController>(
                                    builder: (controller) => IconButton(
                                      onPressed: () {
                                        if (controller.isFavorite[
                                                itemsModel.itemId] ==
                                            "1") {
                                          controller.setFavorite(
                                              itemsModel.itemId, "0");
                                          controller.removeFavorite(
                                              itemsModel.itemId!.toString());
                                        } else {
                                          controller.setFavorite(
                                              itemsModel.itemId, "1");
                                          controller.addFavorite(
                                              itemsModel.itemId!.toString());
                                        }
                                      },
                                      icon: Icon(
                                        controller.isFavorite[
                                                    itemsModel.itemId] ==
                                                "1"
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${itemsModel.itemspricediscount!}\$",
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sans"),
                              ),
                              GetBuilder<FavoriteController>(
                                builder: (controller) => IconButton(
                                  onPressed: () {
                                    if (controller
                                            .isFavorite[itemsModel.itemId] ==
                                        "1") {
                                      controller.setFavorite(
                                          itemsModel.itemId, "0");
                                      controller.removeFavorite(
                                          itemsModel.itemId!.toString());
                                    } else {
                                      controller.setFavorite(
                                          itemsModel.itemId, "1");
                                      controller.addFavorite(
                                          itemsModel.itemId!.toString());
                                    }
                                  },
                                  icon: Icon(
                                    controller.isFavorite[itemsModel.itemId] ==
                                            "1"
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                  ],
                ),
              ),
              if (itemsModel.itemDiscount != 0)
                Positioned(
                  top: 4,
                  left: 4,
                  child: Image.asset(
                    AppImageAsset.saleOne,
                    width: 40,
                  ),
                )
            ],
          ),
        ));
  }
}
