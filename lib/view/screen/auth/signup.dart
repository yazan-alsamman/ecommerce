// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tataboq_app/controller/auth/signup_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/functions/alertexitapp.dart';
import 'package:tataboq_app/core/functions/validinput.dart';
import 'package:tataboq_app/view/widget/auth/CustomButtonAuth.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextBodyAuth.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextFormAuth.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextTitleAuth.dart';
import 'package:tataboq_app/view/widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: T,
        title: Text(
          "9".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            CustomTextTitleAuth(
                              text: "10".tr,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextBodyAuth(
                              text: "24".tr,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomTextFormAuth(
                              isNumber: F,
                              valid: (val) {
                                return validInput(val!, 5, 20, "username");
                              },
                              mycontroller: controller.username,
                              hintText: "23".tr,
                              iconData: Icons.person_outline,
                              labelText: "20".tr,
                            ),
                            CustomTextFormAuth(
                              isNumber: F,
                              valid: (val) {
                                return validInput(val!, 5, 50, "email");
                              },
                              mycontroller: controller.email,
                              hintText: "12".tr,
                              iconData: Icons.email_outlined,
                              labelText: "18".tr,
                            ),
                            CustomTextFormAuth(
                              isNumber: T,
                              valid: (val) {
                                return validInput(val!, 10, 10, "phone");
                              },
                              mycontroller: controller.phone,
                              hintText: "22".tr,
                              iconData: Icons.phone_outlined,
                              labelText: "21".tr,
                            ),
                            CustomTextFormAuth(
                              isNumber: F,
                              valid: (val) {
                                return validInput(val!, 5, 30, "password");
                              },
                              mycontroller: controller.password,
                              hintText: "13".tr,
                              iconData: Icons.lock_outline,
                              labelText: "19".tr,
                            ),
                            CustomBottomAuth(
                              text: "58".tr,
                              onPressed: () {
                                controller.signIn();
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            CustomTextSignUpOrSignIn(
                              textone: "25".tr,
                              texttwo: "26".tr,
                              onTap: () {
                                controller.goToSignIn();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
