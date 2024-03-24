// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/constants/theme.dart';

class UserInputBox extends StatelessWidget {
  const UserInputBox({
    super.key,
    required this.onChanged,
  });

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: qgrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 5, bottom: 5, right: 3, left: 10),
      child: TextField(
        onChanged: onChanged,
        keyboardType: TextInputType.text,
        cursorColor: qblue,
        cursorHeight: 18,
        style: GoogleFonts.poppins(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: qblack,
        ),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          labelText: 'Ask me anything...',
          labelStyle: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: qdark2.withOpacity(0.6),
          ),
          isDense: true,
          contentPadding: const EdgeInsets.only(left: 10),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.network(
              'https://www.svgrepo.com/show/491673/mic.svg',
              color: qdark2.withOpacity(0.6),
            ),
          ),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          // enabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   borderSide: BorderSide(
          //     width: 1.1,
          //     color: qdark2.withOpacity(0.1),
          //   ),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          //   borderSide: BorderSide(
          //     width: 1.2,
          //     color: qdark2.withOpacity(0.2),
          //   ),
          // ),
        ),
      ),
    );
  }
}
