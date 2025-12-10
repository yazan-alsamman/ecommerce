// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tataboq_app/controller/auth/verifycodesignup_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextBodyAuth.dart';
import 'package:tataboq_app/view/widget/auth/CustomTextTitleAuth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        centerTitle: T,
        title: Text(
          "43".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: ListView(
              children: [
                CustomTextTitleAuth(
                  text: "41".tr,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextBodyAuth(
                  text: "please Enter the code sent to ${controller.email}",
                ),
                SizedBox(
                  height: 15,
                ),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.goToSuccessSignUp(verificationCode);
                  }, // end onSubmit
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    controller.reSend();
                  },
                  child: Center(
                      child: Text(
                    "Resend Verify Code",
                    style:
                        TextStyle(color: AppColor.primaryColor, fontSize: 22),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
