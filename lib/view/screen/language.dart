import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/core/localaization/changelocal.dart';
import 'package:tataboq_app/view/widget/language/custombuttomlang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "choose your prefered Language",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonlang(
              textbutton: "Ar",
              onPressed: () {
                controller.changelang("Ar");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            CustomButtonlang(
              textbutton: "En",
              onPressed: () {
                controller.changelang("En");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            CustomButtonlang(
              textbutton: "Fr",
              onPressed: () {
                controller.changelang("Fr");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
