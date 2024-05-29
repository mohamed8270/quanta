import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/constants/theme.dart';

class SettingsWidgetShape extends StatelessWidget {
  const SettingsWidgetShape(
      {super.key,
      required this.boxcolor,
      required this.txt,
      required this.leading,
      required this.actions,
      required this.txtcolor,
      required this.click});

  final Color boxcolor;
  final String txt;
  final Color txtcolor;
  final String leading;
  final String actions;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: click,
      child: Container(
        height: screenSize.height * 0.07,
        width: screenSize.width,
        decoration: BoxDecoration(color: boxcolor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.network(
                    leading,
                    height: 20,
                    width: 20,
                    colorFilter:
                        const ColorFilter.mode(qblack, BlendMode.srcIn),
                  ),
                  ThemeClass.space4,
                  Text(txt, style: ThemeClass.heading4),
                ],
              ),
              Text(
                actions,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsPrefWidgets extends StatelessWidget {
  const SettingsPrefWidgets({super.key, required this.txt});

  final String txt;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * 0.07,
      width: screenSize.width,
      decoration: const BoxDecoration(color: qgrey),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(txt, style: ThemeClass.heading4),
      ),
    );
  }
}
