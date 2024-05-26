import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

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
const Color qred = Color(0xFFBF455B);
const Color qyellow = Color(0xFFFF9900);
const Color qcode = Color(0xFF011627);

// Theme class
class ThemeClass {
  static String heroGreeting = 'Start harvesting your money here';
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

  static TextStyle heading7 = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: qblack.withOpacity(0.3),
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

  static TextStyle genAiTxt = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: qwhite,
  );

  // Padding
  static EdgeInsets padding0 =
      const EdgeInsets.only(right: 10, left: 10, top: 20);

  static EdgeInsets padding1 = const EdgeInsets.only(right: 10, left: 10);

  static EdgeInsets padding2 = const EdgeInsets.only(right: 10);

  static EdgeInsets padding3 = const EdgeInsets.only(left: 10);

  // Spaces
  static Gap space0 = const Gap(5);
  static Gap space1 = const Gap(10);
  static Gap space2 = const Gap(15);
  static Gap space3 = const Gap(20);
  static Gap space4 = const Gap(30);
  static Gap space5 = const Gap(80);
}
