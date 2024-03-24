// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/constants/theme.dart';

class ChatPageAppBar extends StatelessWidget {
  const ChatPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: qwhite,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: qgrey,
              width: 0.7,
            ),
          ),
        ),
      ),
      centerTitle: false,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.all(12),
        child: SvgPicture.network(
          'https://www.svgrepo.com/show/315017/chat.svg',
          height: 16,
          width: 16,
          color: qblue,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Quanta",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: qblack,
            ),
          ),
          Text(
            "Unleash the power of AI conversation",
            style: GoogleFonts.poppins(
              fontSize: 7,
              fontWeight: FontWeight.w500,
              color: qdark2.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
