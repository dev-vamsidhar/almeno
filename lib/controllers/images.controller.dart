import 'dart:io';

import 'package:alemenotest/controllers/notification.controller.dart';
import 'package:alemenotest/views/thankyou.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  

  double width = 80;
  double height = 80;
  uploadSharedMeal(File file) async {
    EasyLoading.show(status: "Uploading...");
    await FirebaseStorage.instance
        .ref()
        .child("meal${DateTime.now()}.jpg")
        .putFile(file)
        .whenComplete(() async {
      EasyLoading.dismiss();
      await FirebaseCloudNotification().sendlocalforegroundnotification(
          const RemoteMessage(
              notification: RemoteNotification(
                  title: "Thank you",
                  body: "Thank you for sharing food with me")));
      Get.to(const ThankYou());
    });
  }
}
