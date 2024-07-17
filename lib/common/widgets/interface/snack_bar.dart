import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';

class SnackBarClass {
  // Snack bars
  void successSnack() {
    Get.snackbar(
      'Success',
      'The task has been completed successfully',
      snackPosition: SnackPosition.BOTTOM,
      colorText: qwhite,
      backgroundColor: qgreen,
      titleText: Text(
        'Success',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: qwhite,
        ),
      ),
      messageText: Text(
        'The task has been completed successfully',
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: qwhite,
        ),
      ),
    );
  }

  void errorSnack(e) {
    Get.snackbar(
      'Error',
      'Failed to load: $e',
      snackPosition: SnackPosition.BOTTOM,
      colorText: qwhite,
      backgroundColor: qred,
      titleText: Text(
        'Error',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: qwhite,
        ),
      ),
      messageText: Text(
        'Failed to load: $e',
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: qwhite,
        ),
      ),
    );
  }

  void warningSnack() {
    Get.snackbar(
      'Warning',
      'An unexpected thing happened!',
      snackPosition: SnackPosition.BOTTOM,
      colorText: qblack,
      backgroundColor: qgrey,
      titleText: Text(
        'Warning',
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: qblack,
        ),
      ),
      messageText: Text(
        'An unexpected thing happened!',
        style: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: qblack,
        ),
      ),
    );
  }

  Widget errorSnack404(context, e) {
    final screenSize = MediaQuery.sizeOf(context);
    var text = TextClass();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenSize.height * 0.2,
            width: screenSize.width * 0.4,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-5529.jpg'),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          StaticClass.gap1,
          SizedBox(
            width: screenSize.width * 0.85,
            child: text.textWidget('$e', 10.0, TextClass.w6, qblack,
                TextOverflow.visible, 1.5, TextAlign.center),
          ),
        ],
      ),
    );
  }
}
