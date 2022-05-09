import 'package:alemenotest/views/clickmeal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(ClickMeal());
                },
                child: Container(
                  width: 229,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff3E8B3A)),
                  child: Center(
                      child: Text("Share your meal",
                          style: GoogleFonts.andika(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w400),
                          ))),
                ),
              ),
            ),
            const SizedBox(
              height: 112,
            )
          ]),
    );
  }
}
