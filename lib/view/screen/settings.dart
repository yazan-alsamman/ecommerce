// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/settings_controller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/constant/imageasset.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/view/local%20notification/localnotification_services.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.primaryColor,
              ),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: AssetImage(AppImageAsset.avatar),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ListTile(
                  //   onTap: () {},
                  //   title: Text("Disable Notifications"),
                  //   trailing: Switch(
                  //     onChanged: (val) {},
                  //     value: true,
                  //     activeColor: AppColor.primaryColor,
                  //   ),
                  // ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.orderspending);
                    },
                    title: Text("orders"),
                    trailing: Icon(Icons.local_shipping_outlined),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersarchived);
                    },
                    title: Text("Archived orders"),
                    trailing: Icon(Icons.card_travel_outlined),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.adressview);
                    },
                    title: Text("Adress"),
                    trailing: Icon(Icons.location_on),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      // Get.toNamed(AppRoute.notification);
                    },
                    title: Text("About us"),
                    trailing: Icon(Icons.help),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:+963936862035"));
                    },
                    title: Text("Contact us"),
                    trailing: Icon(Icons.phone),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: Text("Logout"),
                    trailing: Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
