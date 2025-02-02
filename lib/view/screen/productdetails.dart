// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/productdetials_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/view/widget/productdetails/priceandamount.dart';
import 'package:tataboq_app/view/widget/productdetails/subitemslist.dart';
import 'package:tataboq_app/view/widget/productdetails/toppageproductsdetails.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.secondColor,
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child: Text(
            "Go To Cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              TopProductPageDetails(),
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.itemsModel.itemName}",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: AppColor.fourthColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PriceAndCountItems(
                      onAdd: () {
                        controller.add();
                      },
                      onRemove: () {
                        controller.remove();
                      },
                      price: "${controller.itemsModel.itemspricediscount}",
                      count: "${controller.countitems}",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("${controller.itemsModel.itemDesc}",
                        style: Theme.of(context).textTheme.bodyText1!),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "color",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: AppColor.fourthColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SubItemsList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
