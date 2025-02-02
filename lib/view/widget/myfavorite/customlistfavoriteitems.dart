// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/myfavorite_controller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/functions/translatedatabase.dart';
import 'package:tataboq_app/data/model/myfavorite.dart';
import 'package:tataboq_app/linkapi.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  final Data itemsModel;
  //final bool active;
  const CustomListFavoriteItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          //controller.goToPageProductDetails(itemsModel);
        },
        child: Card(
          child: Padding(
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
                  height: 10,
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
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${itemsModel.itemPrice!}\$",
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans"),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.deleteFromFavorite(
                            itemsModel.favoriteId!.toString());
                      },
                      icon: Icon(Icons.delete_outline_outlined),
                      color: AppColor.primaryColor,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
