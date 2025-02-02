import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/onboardingcontroller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/view/widget/onboarding/custombutton.dart';
import 'package:tataboq_app/view/widget/onboarding/dotcontroller.dart';
import 'package:tataboq_app/view/widget/onboarding/slider.dart';

class onBoarding extends StatelessWidget {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: SafeArea(
        //minimum: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
                  Spacer(
                    flex: 2,
                  ),
                  CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
