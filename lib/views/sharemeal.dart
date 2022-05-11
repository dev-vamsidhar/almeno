import 'dart:io';

import 'package:alemenotest/controllers/images.controller.dart';
import 'package:alemenotest/views/thankyou.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShareMeal extends StatelessWidget {
  String path = "";
  ShareMeal({Key? key, required this.path}) : super(key: key);
  ImageController imageController = Get.put(ImageController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: const Color(0xff3E8B3A),
                    borderRadius: BorderRadius.circular(1000)),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          GetBuilder<ImageController>(builder: (_) {
            return Center(
              child: AnimatedContainer(
                width: imageController.width,
                height: imageController.height,
                duration: const Duration(seconds: 3),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/animal.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
                color: Color(0xffF4F4F4),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.all(17.0) + const EdgeInsets.only(top: 50),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.file(
                          File(path),
                          fit: BoxFit.cover,
                        )),
                  ),
                ]),
              ),
              const SizedBox(height: 50),
              Center(
                child: Text("Will you eat this?",
                    style: GoogleFonts.andika(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            color: Color(0xff3C3C3C)))),
              ),
              InkWell(
                onTap: () async {
                  imageController.width = 150;
                  imageController.height = 150;
                  imageController.update();
                  await ImageController().uploadSharedMeal(File(path));
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                          color: const Color(0xff3E8B3A),
                          borderRadius: BorderRadius.circular(1000)),
                      child: Image.asset("assets/tick.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ]),
          )
        ]),
      ),
    );
  }
}
