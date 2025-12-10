import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/homescreen_controller.dart';
import 'package:tataboq_app/view/widget/home/custombuttonappbar.dart';

class CustomButtonAppBarHome extends StatelessWidget {
  const CustomButtonAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.07, 
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(
              controller.listPage.length + 1,
              ((index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : Expanded(
                        child: CustomButtonAppBar(
                          textbutton: controller.bottomappbar[i]['title'],
                          icondata: controller.bottomappbar[i]['icon'],
                          onPressed: () {
                            controller.changePage(i);
                          },
                          active: controller.currentpage == i ? true : false,
                        ),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}