// import 'package:get/get.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:tataboq_app/core/class/statusrequest.dart';

// class MapController extends GetxController {
//   // Reactive variables
//   StatusRequest statusRequest = StatusRequest.loading;
//   LatLng? currentLocation;

//   @override
//   void onInit() {
//     super.onInit();
//     getCurrentLocation();
//   }

//   Future<void> getCurrentLocation() async {
//     // Check if location services are enabled
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled, show a message or request to enable them
//       print("Location services are disabled.");
//       statusRequest = StatusRequest.failure;
//       return;
//     }

//     // Check location permissions
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, show a message
//         print("Location permissions are denied.");
//         statusRequest = StatusRequest.failure;
//         return;
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are permanently denied, show a message
//       print("Location permissions are permanently denied.");
//       statusRequest = StatusRequest.none;
//       return;
//     }

//     // Fetch the current location
//     Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//     statusRequest = StatusRequest.success;
//     update();

//     // Update the state with the current location
//     currentLocation = LatLng(position.latitude, position.longitude);
//     statusRequest = StatusRequest.success;
//     update();
//   }
// }
