// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/components/appbar_widget.dart';
import 'package:quanta/constants/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qwhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/447866/ai-mi-algorithm.svg',
          leadingcolor: qblue,
          txt: 'Quanta',
          actions: [],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('chatpage'),
        backgroundColor: qblue,
        elevation: 0,
        child: SvgPicture.network(
          'https://www.svgrepo.com/show/529062/magic-stick-3.svg',
          height: 28,
          width: 28,
          color: qwhite,
        ),
      ),
      body: Padding(
        padding: ThemeClass.padding0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  qblue,
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
          ],
        ),
      ),
    );
  }
}
