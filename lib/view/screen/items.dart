import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/favorite_controller.dart';
import 'package:tataboq_app/controller/items_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/data/model/itemsmodel.dart';
import 'package:tataboq_app/view/screen/home.dart';
import 'package:tataboq_app/view/widget/customAppbar.dart';
import 'package:tataboq_app/view/widget/items/customlistitem.dart';
import 'package:tataboq_app/view/widget/items/listcategoriesitem.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double screenWidth = constraints.maxWidth;
          final double screenHeight = constraints.maxHeight;

          return Container(
            padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
            child: ListView(
              children: [
                CustomAppBar(
                  mycontroller: controller.search!,
                  onPressedIconFavorite: () {
                    Get.toNamed(AppRoute.myfavorite);
                  },
                  titleappbar: "Find Product",
                  onPressedSearch: () {
                    controller.onSearchItems();
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive spacing
                const ListCategoriesItem(),
                GetBuilder<ItemsControllerImp>(
                  builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: screenWidth > 600 ? 3 : 2, // Adjust items per row based on screen width
                              childAspectRatio: screenWidth > 600 ? 0.8 : 0.7, // Adjust aspect ratio
                              crossAxisSpacing: screenWidth * 0.02, // Responsive spacing
                              mainAxisSpacing: screenHeight * 0.02, // Responsive spacing
                            ),
                            itemBuilder: (BuildContext context, index) {
                              controllerFav.isFavorite[controller.data[index]['item_id']] =
                                  controller.data[index]['favorite'].toString();
                              return CustomListItems(
                                itemsModel: ItemsModel.fromJson(controller.data[index]),
                              );
                            },
                          )
                        : ListItemsSearch(listdataModel: controller.listdata),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}