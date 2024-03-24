// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanta/constants/theme.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.click,
  });

  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: click,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: screenSize.width * 0.12,
        height: screenSize.height * 0.06,
        decoration: BoxDecoration(
          color: qwhite,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: SvgPicture.network(
          'https://www.svgrepo.com/show/499642/send.svg',
          height: 26,
          width: 26,
          color: qblue,
        ),
      ),
    );
  }
}
