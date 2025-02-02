// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tataboq_app/controller/auth/login_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/functions/alertexitapp.dart';
import 'package:tataboq_app/core/functions/validinput.dart';
import 'package:tataboq_app/view/widget/auth/CustomButtonAuth.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextBodyAuth.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextFormAuth.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextTitleAuth.dart';
import 'package:tataboq_app/view/widget/auth/logoauth.dart';
import 'package:tataboq_app/view/widget/auth/textsignup.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
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
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      LogoAuth(),
                      CustomTextTitleAuth(
                        text: "10".tr,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextBodyAuth(
                        text: "11".tr,
                      ),
                      SizedBox(
                        height: 15,
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
                      GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                          isNumber: F,
                          valid: (val) {
                            return validInput(val!, 5, 30, "password");
                          },
                          mycontroller: controller.password,
                          hintText: "13".tr,
                          iconData: controller.isshowpassword == true
                              ? Icons.remove_red_eye
                              : Icons.hide_source_rounded,
                          labelText: "19".tr,
                          obscureText: controller.isshowpassword,
                          onTapIcon: () {
                            controller.showPassword();
                          },
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.goToForgetPassword();
                        },
                        child: Text(
                          "14".tr,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      CustomBottomAuth(
                        text: "15".tr,
                        onPressed: () {
                          controller.login();
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextSignUpOrSignIn(
                        textone: "16".tr,
                        texttwo: "17".tr,
                        onTap: () {
                          controller.goToSignUp();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
