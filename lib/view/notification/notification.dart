// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'package:tataboq_app/controller/deviceregister_controller.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('@mipmap/ic_launcher');

//   const InitializationSettings initializationSettings =
//       InitializationSettings(android: initializationSettingsAndroid);

//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);

//   // Start HTTP server
//   startServer();

//   runApp(NotificationApp());
// }

// void startServer() async {
//   // Start an HTTP server on port 5000
//   final server = await HttpServer.bind(InternetAddress.anyIPv4, 8081);
//   print(
//       "Server running on IP: ${server.address.address} and port: ${server.port}");

//   await for (HttpRequest request in server) {
//     if (request.method == 'POST') {
//       // Parse the incoming request
//       final content = await utf8.decoder.bind(request).join();
//       final data = jsonDecode(content);

//       final String? title = data['title'];
//       final String? body = data['body'];

//       // Show the local notification
//       if (title != null && body != null) {
//         showLocalNotification(title, body);
//       }

//       request.response
//         ..statusCode = HttpStatus.ok
//         ..write('Notification Triggered')
//         ..close();
//     }
//   }
// }

// void showLocalNotification(String title, String body) async {
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'your_channel_id',
//     'your_channel_name',
//     importance: Importance.max,
//     priority: Priority.high,
//     showWhen: true,
//   );

//   const NotificationDetails platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//   );

//   await flutterLocalNotificationsPlugin.show(
//     0, // Notification ID
//     title, // Notification Title
//     body, // Notification Body
//     platformChannelSpecifics,
//   );
// }

// class NotificationApp extends StatelessWidget {
//   DeviceRegisterController controller = Get.put(DeviceRegisterController());
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("Local Notifications Server")),
//         body: Center(
//           child: Text(
//             "Listening for notification triggers...",
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
