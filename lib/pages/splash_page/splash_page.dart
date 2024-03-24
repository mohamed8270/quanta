// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quanta/constants/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qwhite,
      body: SafeArea(
        child: Center(
          child: SvgPicture.network(
            'https://www.svgrepo.com/show/529046/library.svg',
            height: 200,
            width: 200,
            color: qblue,
          ),
        ),
      ),
    );
  }
}
