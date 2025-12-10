// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/view/screen/home.dart';
import 'package:tataboq_app/view/screen/offers.dart';
import 'package:tataboq_app/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    const Home(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Settings"),
        )
      ],
    ),
    OffersView(),
    Settings(),
  ];
  List bottomappbar = [
    {
      "title": "home",
      "icon": Icons.home,
    },
    {
      "title": "Notifications",
      "icon": Icons.notification_add_outlined,
    },
    {
      "title": "offers",
      "icon": Icons.local_offer_sharp,
    },
    {
      "title": "Settings",
      "icon": Icons.settings_sharp,
    },
  ];
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
