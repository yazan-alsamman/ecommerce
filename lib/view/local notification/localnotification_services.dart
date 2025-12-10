// notification_service.dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotification({
  required int id,
  required String title,
  required String body,
  String payload = 'data',
}) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'your_channel_id', // Channel ID
          'your_channel_name', // Channel Name
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false,
          icon: '@mipmap/ic_launcher');

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    id, // Notification ID
    title, // Title
    body, // Body
    platformChannelSpecifics, // Notification details
    payload: payload, // Payload
  );
}
