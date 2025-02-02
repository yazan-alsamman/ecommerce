// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables
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
   ItemsControllerImp controller= Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              mycontroller: controller.search!,
              onPressedIconFavorite: () {
                Get.toNamed(AppRoute.myfavorite);
              },
              titleappbar: "Find Product",
              //onPressedIcon: () {},
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ListCategoriesItem(),
            GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:!controller.isSearch? GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, index) {
                    controllerFav
                            .isFavorite[controller.data[index]['item_id']] =
                        controller.data[index]['favorite'].toString();
                    return CustomListItems(
                        itemsModel:
                            ItemsModel.fromJson(controller.data[index]));
                  },
                ):ListItemsSearch(
                      listdataModel: controller.listdata,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
