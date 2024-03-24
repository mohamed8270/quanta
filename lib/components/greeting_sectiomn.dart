import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/constants/theme.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              qyellow,
              qorange,
            ],
            tileMode: TileMode.mirror,
          ).createShader(bounds),
          child: Text(
            "Hello, Mohamed",
            style: GoogleFonts.poppins(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: qwhite,
            ),
          ),
        ),
        Text(
          "How can I help you today?",
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: qdark2.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
