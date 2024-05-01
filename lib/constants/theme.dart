import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/interface/reusable/user_input_box.dart';

// Primary Colors
const Color qblack = Color(0xFF242424);
const Color qblue = Color(0xFF4d83ef);
const Color qwhite = Color(0xFFFFFFFF);

// Secondary Colors
const Color qgreen = Color(0xFF0EB56F);
const Color qdark1 = Color(0xFF212330);
const Color qdark2 = Color(0xFF2c313f);
const Color qorange = Color(0xFFd76573);
const Color qpink = Color(0xFFF91C4F);
const Color qviolet = Color(0xFFa070c3);
const Color qgrey = Color(0xFFECECEC);
const Color qred = Color(0xFFFF0000);
const Color qyellow = Color(0xFFFF9900);
const Color qcode = Color(0xFF011627);

// Theme class
class ThemeClass {
  static String heroGreeting = 'Start harvesting your money here ➡️';
  static String heroGreeting2 = 'Make a wise decission with';
  static String heroGreeting3 = 'Info Harvest & Quanta';
  static String heroGreeting4 =
      'The powerful tool present in the market for the user to make price decission well, Unlock the potential of saving money over every order you make!';

  static TextStyle heroGreetingTxt = GoogleFonts.poppins(
    fontSize: 38,
    fontWeight: FontWeight.w700,
    color: qblack,
  );

  static TextStyle heroGreetingTxt2 = GoogleFonts.poppins(
    fontSize: 38,
    fontWeight: FontWeight.w700,
    color: qwhite,
  );

  static TextStyle heading0 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: qblack,
  );

  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: qblack,
  );

  static TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: qblack,
  );

  static TextStyle heading3 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: qblack,
  );

  static TextStyle heading4 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: qblack,
  );

  static TextStyle heading5 = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: qblack,
  );

  static TextStyle heading6 = GoogleFonts.poppins(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: qdark1.withOpacity(0.5),
  );

  static TextStyle brandName = GoogleFonts.poppins(
    fontSize: 8,
    fontWeight: FontWeight.w500,
    color: qdark1.withOpacity(0.5),
  );

  static TextStyle offerTxt = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: qwhite,
  );

  static TextStyle symbolTxt = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: qblack,
  );

  static TextStyle priceTxt = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: qblack,
  );

  static TextStyle titleTxt = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: qblack,
    height: 1.5,
  );

  static TextStyle detailPriceTxt = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: qblack,
  );

  static TextStyle detailDiscountTxt = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: qwhite,
  );

  static TextStyle detailDiscountPercentageTxt = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: qred,
  );

  static TextStyle detailMrpTxt = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: qblack,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle detailDescriptionTxt = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: qblack,
  );

  static TextStyle buttonTxt = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: qwhite,
  );

  // Padding
  static EdgeInsets padding0 =
      const EdgeInsets.only(right: 10, left: 10, top: 20);

  // Spaces
  static Gap space0 = const Gap(5);
  static Gap space1 = const Gap(10);
  static Gap space2 = const Gap(15);
  static Gap space3 = const Gap(20);
  static Gap space4 = const Gap(30);
  static Gap space5 = const Gap(80);

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
          ThemeClass.space1,
          SizedBox(
            width: screenSize.width * 0.85,
            child: Text(
              '$e',
              style: ThemeClass.heading5,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> mailDialogueBox(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    var trackController = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: qwhite,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.network(
                'https://www.svgrepo.com/show/303264/amazon-2-logo.svg',
                height: 38,
                width: 38,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: SvgPicture.network(
                  'https://www.svgrepo.com/show/444605/cross.svg',
                  height: 18,
                  width: 18,
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: screenSize.height * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stay updated with product pricing alerts right in your inbox',
                  style: ThemeClass.heading3,
                ),
                ThemeClass.space0,
                Text(
                  'Never miss a bargain with our timely alerts!',
                  style: ThemeClass.heading6,
                ),
                ThemeClass.space3,
                Text('Email Address', style: ThemeClass.heading5),
                ThemeClass.space0,
                UserTrackInputBox(txt: 'Email', controller: trackController),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: screenSize.height * 0.055,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: qblack,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text('Track', style: ThemeClass.detailDiscountTxt),
              ),
            ),
          ],
        );
      },
    );
  }
}
