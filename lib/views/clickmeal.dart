import 'package:alemenotest/views/sharemeal.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ClickMeal extends StatefulWidget {
  const ClickMeal({Key? key}) : super(key: key);

  @override
  State<ClickMeal> createState() => _ClickMealState();
}

class _ClickMealState extends State<ClickMeal> {
  late CameraController controller;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();

    controller = CameraController(
        CameraDescription(
            name: "0",
            lensDirection: CameraLensDirection.back,
            sensorOrientation: 0),
        ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
          Center(
            child: Container(
              height: 80,
              width: 80,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/animal.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/fork.png"),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                              height: 180,
                              width: 180,
                              // decoration: BoxDecoration(
                              //     color: Color(0xff404040),
                              //     borderRadius: BorderRadius.circular(1000)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child: CameraPreview(controller))),
                          Container(
                            width: 200,
                            height: 200,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset("assets/camsqr.png"),
                                      RotatedBox(
                                          quarterTurns: 1,
                                          child:
                                              Image.asset("assets/camsqr.png"))
                                    ],
                                  ),
                                  RotatedBox(
                                    quarterTurns: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset("assets/camsqr.png"),
                                        RotatedBox(
                                            quarterTurns: 1,
                                            child: Image.asset(
                                                "assets/camsqr.png"))
                                      ],
                                    ),
                                  )
                                ]),
                          )
                        ],
                      ),
                      Image.asset("assets/spoon.png"),
                    ]),
              ),
              const SizedBox(height: 50),
              Center(
                child: Text("Click your meal",
                    style: GoogleFonts.andika(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                            color: Color(0xff3C3C3C)))),
              ),
              InkWell(
                onTap: () async {
                  controller.setFlashMode(FlashMode.off);
                  EasyLoading.show(status: "");
                  XFile imagefile = await controller.takePicture();
                  print(imagefile.path);
                  EasyLoading.dismiss();
                  Get.to(ShareMeal(path: imagefile.path));
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
                      child: Image.asset("assets/camera.png"),
                    ),
                  ),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}
