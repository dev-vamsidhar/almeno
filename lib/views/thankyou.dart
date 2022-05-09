import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "GOOD JOB",
                style: GoogleFonts.lilitaOne(
                    textStyle:const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff3E8B3A),
                        fontSize: 48)),
              ),
            )
          ]),
    );
  }
}
