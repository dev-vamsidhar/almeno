import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseCloudNotification extends GetxController {
  @override
  void onInit() {
    initialisefcm();
    getfcmToken();
    super.onInit();
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  initialisefcm() async {
    await messaging.setForegroundNotificationPresentationOptions(
        alert: true, sound: true, badge: true);
    await messaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      sendlocalforegroundnotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Get.to(NotificationCenter());
    });
    FirebaseMessaging.onBackgroundMessage((message) async {
      // Get.to(NotificationCenter());
    });
  }

  ///It will trigger the local notification when app is in foreground
  Future sendlocalforegroundnotification(RemoteMessage message) async {
    await flutterLocalNotificationsPlugin.initialize(
      const  InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
            iOS: IOSInitializationSettings()), onSelectNotification: (payload) {
      // Get.to(NotificationCenter());
    });
    RemoteNotification? notification = message.notification;

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
    );
    if (true) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification?.title,
        notification?.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    }
  }

  Future<String?> getfcmToken() async {
    String? token = await messaging.getToken();
    return token;
  }
}
