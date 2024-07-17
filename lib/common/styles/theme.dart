import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Primary Colors
const Color qblack = Color(0xFF242424);
const Color qwhite = Color(0xFFFFFFFF);
const Color qyellow = Color(0xFFFF9900);
// Secondary Colors
const Color qorange = Color(0xFFd76573);
const Color qgrey = Color(0xFFECECEC);
// interface colors
const Color qgreen = Color(0xFF0EB56F);
const Color qred = Color(0xFFBF455B);

// fonts
class TextClass {
  // text weight
  static FontWeight w1 = FontWeight.w100;
  static FontWeight w2 = FontWeight.w200;
  static FontWeight w3 = FontWeight.w300;
  static FontWeight w4 = FontWeight.w400;
  static FontWeight w5 = FontWeight.w500;
  static FontWeight w6 = FontWeight.w600;
  static FontWeight w7 = FontWeight.w700;
  static FontWeight w8 = FontWeight.w800;
  static FontWeight w9 = FontWeight.w100;

  // text widget
  Widget textWidget(txt, s, w, color, [f, h, align, l]) {
    return Text(
      txt,
      overflow: f,
      textAlign: align,
      maxLines: l,
      style: GoogleFonts.poppins(
        fontSize: s,
        fontWeight: w,
        color: color,
        height: h,
      ),
    );
  }
}
