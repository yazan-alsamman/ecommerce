// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/cart_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/view/widget/cart/appbarcart.dart';
import 'package:tataboq_app/view/widget/cart/custom_bottom_navigation_bar_cart.dart';
import 'package:tataboq_app/view/widget/cart/customitemscartlist.dart';
import 'package:tataboq_app/view/widget/cart/topcardcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => BottomNavigationBarCart(
          price: "${cartController.priceorder}\$",
          shipping: "200\$",
          totalPrice: "300\$",
        ),
      ),
      body: GetBuilder<CartController>(
        builder: ((controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  TopAppBarCart(
                    title: "My Cart",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TopCardCart(
                    message:
                        "You Have ${cartController.totalcountitem} Items in Your List",
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(
                          cartController.data.length,
                          (index) => CustomItemsCartList(
                            onAdd: () async{
                             await cartController.add(cartController
                                  .data[index].itemId!
                                  .toString());
                              cartController.refreshPage();
                            },
                            onRemove: ()async {
                             await cartController.delete(cartController
                                  .data[index].itemId!
                                  .toString());
                              cartController.refreshPage();
                            },
                            imagename:
                                "${cartController.data[index].itemImage}",
                            name: "${cartController.data[index].itemName}",
                            price: "${cartController.data[index].itemprice}",
                            count: "${cartController.data[index].countitems}",
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
