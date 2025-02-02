import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:tataboq_app/bindings/initialbinding.dart';
import 'package:tataboq_app/core/localaization/changelocal.dart';
import 'package:tataboq_app/core/localaization/translation.dart';
import 'package:tataboq_app/core/services/services.dart';
import 'package:tataboq_app/routes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: F,
      title: "",
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding:InitialBindings() ,
     getPages: routes,
    );
  }
}
