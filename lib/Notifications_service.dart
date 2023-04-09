import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsServices{
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidInitializationSettings = AndroidInitializationSettings('images/logo.jpg');

  void initialiseNotifications() async {
    InitializationSettings initializationSettings = InitializationSettings(
        android: _androidInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

  }

  void sendNotification(String title, String body) async {

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      priority: Priority.high,
      );

    NotificationDetails notificationDetails = NotificationDetails();

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
      );
  }

}