import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClickMeal extends StatelessWidget {
  const ClickMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset("assets/animal.png"),
        ),
        Spacer(),
        Container(
          height: Get.height / 1.6,
          decoration: BoxDecoration(
              color: Color(0xffF4F4F4),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40))),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [])
          ]),
        )
      ]),
    );
  }
}
