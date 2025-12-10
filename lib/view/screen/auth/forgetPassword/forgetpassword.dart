// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tataboq_app/controller/forget%20password/forgetpassword_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/core/functions/validinput.dart';
import 'package:tataboq_app/view/widget/auth/CustomButtonAuth.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextBodyAuth.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextFormAuth.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextTitleAuth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: T,
        title: Text(
          "40".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        CustomTextTitleAuth(
                          text: "27".tr,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextBodyAuth(
                          text: "29".tr,
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
                          // mycontroller: ,
                        ),
                        CustomBottomAuth(
                          text: "30".tr,
                          onPressed: () {
                            controller.checkemail();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
