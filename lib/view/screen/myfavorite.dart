import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/myfavorite_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/view/widget/customAppbar.dart';
import 'package:tataboq_app/view/widget/myfavorite/customlistfavoriteitems.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.02, // 2% of screen height
          horizontal: screenWidth * 0.04, // 4% of screen width
        ),
        child: GetBuilder<MyFavoriteController>(
          builder: (controller) => ListView(
            children: [
              SizedBox(height: screenHeight * 0.03), // 3% of screen height
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _calculateCrossAxisCount(screenWidth),
                    mainAxisSpacing: screenHeight * 0.02, // 2% of screen height
                    crossAxisSpacing: screenWidth * 0.04, // 4% of screen width
                    childAspectRatio: _calculateAspectRatio(screenWidth),
                  ),
                  itemBuilder: (context, index) {
                    return CustomListFavoriteItems(
                      itemsModel: controller.data[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to calculate the number of columns based on screen width
  int _calculateCrossAxisCount(double screenWidth) {
    if (screenWidth < 600) {
      return 2; // For small phones
    } else if (screenWidth < 900) {
      return 3; // For medium-sized devices (e.g., tablets in portrait mode)
    } else {
      return 4; // For large screens (e.g., tablets in landscape mode)
    }
  }

  // Helper method to calculate the aspect ratio dynamically
  double _calculateAspectRatio(double screenWidth) {
    if (screenWidth < 600) {
      return 0.7; // For small phones
    } else if (screenWidth < 900) {
      return 0.8; // For medium-sized devices
    } else {
      return 1.0; // For large screens
    }
  }
}