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
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02, // 2% of screen width
          vertical: screenHeight * 0.01, // 1% of screen height
        ),
        child: SingleChildScrollView(
          // Add ScrollView to prevent overflow
          child: Stack(
            children: [
              Padding(
                padding:
                    EdgeInsets.all(screenWidth * 0.03), // 3% of screen width
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "${itemsModel.itemId}",
                      child: CachedNetworkImage(
                        imageUrl: AppLink.imageitems + itemsModel.itemImage!,
                        height: screenHeight *
                            0.12, // Reduced height (12% of screen height)
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Image.asset(
                          AppImageAsset.logo,
                          height: screenHeight *
                              0.12, // Fallback image with reduced height
                        ),
                      ),
                    ),
                    SizedBox(
                        height: screenHeight * 0.01), // 1% of screen height
                    Text(
                      "${translateDatabase(itemsModel.itemNameAr, itemsModel.itemName)}",
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: screenWidth * 0.04, // 4% of screen width
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2, // Limit to 2 lines
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                    SizedBox(
                        height: screenHeight * 0.01), // 1% of screen height
                    if (itemsModel.itemDiscount != 0)
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "${itemsModel.itemspricediscount!}\$ ",
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: screenWidth *
                                        0.04, // 4% of screen width
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sans",
                                  ),
                                ),
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
                                    size: screenWidth *
                                        0.06, // 6% of screen width
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: screenHeight * 0.005), // Small spacing
                          Text(
                            "${itemsModel.itemPrice}\$",
                            style: TextStyle(
                              color: AppColor.fourthColor,
                              fontSize:
                                  screenWidth * 0.035, // 3.5% of screen width
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      )
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "${itemsModel.itemspricediscount!}\$",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize:
                                    screenWidth * 0.04, // 4% of screen width
                                fontWeight: FontWeight.bold,
                                fontFamily: "sans",
                              ),
                            ),
                          ),
                          GetBuilder<FavoriteController>(
                            builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemId] ==
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
                                controller.isFavorite[itemsModel.itemId] == "1"
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primaryColor,
                                size: screenWidth * 0.06, // 6% of screen width
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              if (itemsModel.itemDiscount != 0)
                Positioned(
                  top: screenHeight * 0.01, // 1% of screen height
                  left: screenWidth * 0.01, // 1% of screen width
                  child: Image.asset(
                    AppImageAsset.saleOne,
                    width: screenWidth * 0.1, // 10% of screen width
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
