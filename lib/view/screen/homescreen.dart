// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/homescreen_controller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/view/widget/home/custombuttonappnbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child: Icon(
            Icons.shopping_basket_outlined,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomButtonAppBarHome(),
        body: WillPopScope(
            child: controller.listPage.elementAt(controller.currentpage),
            onWillPop: () {
              Get.defaultDialog(
                  title: "Warnning",
                  titleStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                  middleText: "Do You Want To Exit App",
                  onCancel: () {},
                  cancelTextColor: AppColor.secondColor,
                  confirmTextColor: AppColor.secondColor,
                  buttonColor: AppColor.thirdColor,
                  onConfirm: () {
                    exit(0);
                  });
              return Future.value(false);
            }),
      ),
    );
  }
}
