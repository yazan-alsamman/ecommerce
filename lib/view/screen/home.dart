// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/home_controller.dart';
import 'package:tataboq_app/controller/sales_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/data/model/itemsmodel.dart';
import 'package:tataboq_app/linkapi.dart';
import 'package:tataboq_app/view/widget/customAppbar.dart';
import 'package:tataboq_app/view/widget/home/customcardhome.dart';
import 'package:tataboq_app/view/widget/home/customtitlehome.dart';
import 'package:tataboq_app/view/widget/home/listcategorieshome.dart';
import 'package:tataboq_app/view/widget/home/listitemshome.dart';
import 'package:tataboq_app/view/widget/home/listsaleshome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    Get.put(SalesControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
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
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomCardHome(
                          title: "A Summer Surprise",
                          body: "CachBack 20%",
                        ),
                        CustomTitleHome(title: "Categories"),
                        ListCategoriesHome(),
                        CustomTitleHome(title: "Product for you"),
                        ListItemsHome(),
                        CustomTitleHome(title: "Sales"),
                        ListSalesHome(),
                      ],
                    )
                  : ListItemsSearch(
                      listdataModel: controller.listdata,
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdataModel;
  const ListItemsSearch({super.key, required this.listdataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listdataModel.length,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdataModel[index]);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageitems}/${listdataModel[index].itemImage}",
                      )),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdataModel[index].itemName!),
                          subtitle: Text(listdataModel[index].cetegorieName!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
