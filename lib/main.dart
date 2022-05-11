import 'package:alemenotest/controllers/notification.controller.dart';
import 'package:alemenotest/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  Get.put(FirebaseCloudNotification());
  runApp(const MyApp());
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..userInteractions = false
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Vamsidhar',
        builder: EasyLoading.init(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}
