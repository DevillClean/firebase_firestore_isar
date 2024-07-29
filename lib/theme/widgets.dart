import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appText(
    BuildContext context, String text, double fontSize, Color color) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: GoogleFonts.getFont('Lato',
        letterSpacing: 0.9,
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: color),
  );
}

BoxDecoration decorationBox(BuildContext context) {
  return BoxDecoration(
    border: Border.all(color: const Color.fromARGB(53, 0, 0, 0), width: 2),
    borderRadius: BorderRadius.circular(18),
  );
}


SnackBar showSnackBar(BuildContext context, String bmiValue, String bmiStatus,
    String bmiComment) {
  return SnackBar(
    padding: const EdgeInsets.only(left: 8, right: 8),
    elevation: 15,
    backgroundColor: Colors.blueGrey,
    duration: const Duration(seconds: 1000),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16), topRight: Radius.circular(16)),
    ),
    content: SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          appText(context, 'Your BMI is', 16, Colors.white),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          appText(context, bmiValue, 30, Colors.white),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          appText(context, '($bmiStatus)', 16, Colors.white),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          appText(context, bmiComment, 16, Colors.white),
          SizedBox(height: MediaQuery.of(context).size.height * 0.065),
          CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 22,
                  )))
        ],
      ),
    ),
  );
}

SnackBar errorSnackBar(BuildContext context) {
  return SnackBar(
      backgroundColor: const Color.fromARGB(255, 237, 24, 8),
      duration: const Duration(seconds: 2),
      shape: const StadiumBorder(),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.4,
          left: MediaQuery.of(context).size.width * 0.035,
          right: MediaQuery.of(context).size.width * 0.035),
      behavior: SnackBarBehavior.floating,
      // ignore: avoid_unnecessary_containers
      content: Container(
        child: Row(
          children: [
            const Icon(
              Icons.warning_amber_outlined,
              size: 22,
              color: Colors.white,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            appText(context, "BMI doesn't look right.Please check the data ",
                16, Colors.white)
          ],
        ),
      ));
}
