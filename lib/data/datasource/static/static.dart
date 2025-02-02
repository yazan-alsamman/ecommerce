import 'package:get/get.dart';
import 'package:tataboq_app/core/constant/imageasset.dart';
import 'package:tataboq_app/data/model/onboarding.dart';

List<onBoardingModel> onBoardingList = [
  onBoardingModel(
    //page one
    title: "2".tr,
    body: "3".tr,
    image: AppImageAsset.onBoardingImageOne,
  ),
  //page two
  onBoardingModel(
    title: "4".tr,
    body:
        "5".tr,
    image: AppImageAsset.onBoardingImageTwo,
  ),
  //page three
  onBoardingModel(
    title: "6".tr,
    body:
        "7".tr,
    image: AppImageAsset.onBoardingImageThree,
  ),
  //page four
  /*onBoardingModel(
    title: "Fast Delivery",
    body:
        "Reliable And Fast Delivery.We\nDeliver your product the fastest\nway possible.",
    image: AppImageAsset.onBoardingImageFour,
  ),
  */
];
