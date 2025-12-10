// ignore_for_file: prefer_const_constructors, deprecated_member_use, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tataboq_app/controller/auth/successsignup_controller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/view/widget/auth/CustomButtonAuth.dart';

class successSignUp extends StatelessWidget {
  const successSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: T,
        title: Text(
          "32".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                "28".tr,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            SizedBox(height: 50),
            Text(
              "39".tr,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomBottomAuth(
                text: "31".tr,
                onPressed: () {
                  controller.goToPageLogIn();
                },
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
