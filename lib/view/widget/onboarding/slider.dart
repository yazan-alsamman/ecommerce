import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/onboardingcontroller.dart';
import 'package:tataboq_app/core/constant/color.dart';
import 'package:tataboq_app/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          /* 
          */
          const SizedBox(
            height: 80,
          ),
          Image.asset(
            onBoardingList[i].image!,
            height: Get.width / 1.3,
            fit: BoxFit.fill,
          ),
          Text(
            onBoardingList[i].title!,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColor.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  height: 2,
                  color: AppColor.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
