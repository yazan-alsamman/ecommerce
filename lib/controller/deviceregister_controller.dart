// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_ip_address/get_ip_address.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:tataboq_app/core/class/statusrequest.dart';
// import 'package:tataboq_app/core/functions/handlingdata_controller.dart';
// import 'package:tataboq_app/data/datasource/remote/registerdevice_data.dart';

// class DeviceRegisterController extends GetxController {
//   RegisterDeviceData registerDeviceData = RegisterDeviceData(Get.find());
//   String? ip;
//   late StatusRequest statusRequest;
//   // getIpAdress() async {
//   //   try {
//   //     /// Initialize Ip Address
//   //     var ipAddress = IpAddress(type: RequestType.json);

//   //     /// Get the IpAddress based on requestType.
//   //     dynamic data = await ipAddress.getIpAddress();
//   //     ip = data;
//   //     print(data.toString());
//   //   } on IpAddressException catch (exception) {
//   //     /// Handle the exception.
//   //     print(exception.message);
//   //   }
//   // }

//   addDevice() async {
//     statusRequest = StatusRequest.loading;
//     try {
//       /// Initialize Ip Address
//       var ipAddress = IpAddress();

//       /// Get the IpAddress based on requestType.
//       dynamic data = await ipAddress.getIpAddress();
//       ip = data.toString();
//       print(data.toString());
//     } on IpAddressException catch (exception) {
//       /// Handle the exception.
//       print(exception.message);
//     }
//     var response = await registerDeviceData.addDevice(ip.toString());
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         Get.rawSnackbar(
//           title: "notification",
//           messageText: const Text("Added To Devices"),
//         );
//         // data.addAll(response['data']);
//       } else {
//         Get.rawSnackbar(
//           title: "notification",
//           messageText: const Text("Errrrrror"),
//         );
//         statusRequest = StatusRequest.failure;
//       }
//     }
//   }

//   @override
//   void onInit() {
    
//      addDevice();
//     super.onInit();
//   }
// }
