import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/controller/favorite_controller.dart';
import 'package:tataboq_app/controller/offers_controller.dart';
import 'package:tataboq_app/core/class/handlingdata_view.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/view/screen/home.dart';
import 'package:tataboq_app/view/widget/customAppbar.dart';

import 'package:tataboq_app/view/widget/offers/customitemoffer.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OfferController controller = Get.put(OfferController());
    FavoriteController favoriteController = Get.put(FavoriteController());
    return GetBuilder<OfferController>(
        builder: (controller) => Container(
              padding:const  EdgeInsets.symmetric(horizontal: 10),
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
               const   SizedBox(
                    height: 20,
                  ),
                  !controller.isSearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) =>
                                  CustomListItemsOffer(
                                      itemsModel: controller.data[index])))
                      : ListItemsSearch(
                          listdataModel: controller.listdata,
                        ),
                ],
              ),
            ));
  }
}
