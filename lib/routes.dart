// ignore_for_file: unused_import

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tataboq_app/core/constant/routes.dart';
import 'package:tataboq_app/core/middleWare/mymiddleware.dart';
import 'package:tataboq_app/view/screen/auth/forgetPassword/forgetpassword.dart';
import 'package:tataboq_app/view/screen/auth/forgetPassword/success_resetpassword.dart';
import 'package:tataboq_app/view/screen/auth/forgetPassword/verifycodesignup.dart';
import 'package:tataboq_app/view/screen/auth/login.dart';
import 'package:tataboq_app/view/screen/auth/forgetPassword/resetpassword.dart';
import 'package:tataboq_app/view/screen/auth/signup.dart';
import 'package:tataboq_app/view/screen/auth/successSignUp.dart';
import 'package:tataboq_app/view/screen/auth/forgetPassword/veifycode.dart';
import 'package:tataboq_app/view/screen/cart.dart';
import 'package:tataboq_app/view/screen/homescreen.dart';
import 'package:tataboq_app/view/screen/items.dart';
import 'package:tataboq_app/view/screen/language.dart';
import 'package:tataboq_app/view/screen/myfavorite.dart';
import 'package:tataboq_app/view/screen/onboarding.dart';
import 'package:get/get.dart';
import 'package:tataboq_app/view/screen/productdetails.dart';
import 'package:tataboq_app/view/screen/settings.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  //GetPage(name: "/", page: () => const ProductDetails()),
  //GetPage(name: "/", page: () => const Cart()),
  GetPage(name: AppRoute.login, page: () => const login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const successSignUp()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const onBoarding()),
  //
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavorite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),

];
