// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/home_controller.dart';
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
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    HomeControllerImp homeController = Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04), // 4% of screen width
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
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: !controller.isSearch
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomCardHome(
                          title: "${homeController.titleHomeCart}",
                          body: "${homeController.bodyHomeCart}",
                        ),
                        CustomTitleHome(title: "Categories"),
                        ListCategoriesHome(),
                        CustomTitleHome(title: "Top Selling"),
                        !homeController.items.isEmpty
                            ? ListItemsHome()
                            : ListSalesHome(),
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
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive dimensions
    final cardHeight = screenHeight * 0.15; // 15% of screen height
    final fontSizeTitle = screenWidth * 0.045; // 4.5% of screen width
    final fontSizeSubtitle = screenWidth * 0.035; // 3.5% of screen width
    final imageWidth = screenWidth * 0.2; // 20% of screen width
    final imageHeight = screenHeight * 0.1; // 10% of screen height

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listdataModel.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToPageProductDetails(listdataModel[index]);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02), // 2% of screen height
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.03), // 3% of screen width
              ),
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.03), // 3% of screen width
                height: cardHeight,
                child: Row(
                  children: [
                    // Image
                    SizedBox(
                      width: imageWidth,
                      height: imageHeight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.02), // 2% of screen width
                        child: CachedNetworkImage(
                          imageUrl:
                              "${AppLink.imageitems}/${listdataModel[index].itemImage}",
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.04), // 4% of screen width
                    // Text Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            listdataModel[index].itemName ?? "No Name",
                            style: TextStyle(
                              fontSize: fontSizeTitle,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01), // 1% of screen height
                          Text(
                            listdataModel[index].cetegorieName ?? "No Category",
                            style: TextStyle(
                              fontSize: fontSizeSubtitle,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}