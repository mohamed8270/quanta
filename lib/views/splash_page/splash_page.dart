// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quanta/components/internet_error_page.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/constants/utils/static.dart';
import 'package:quanta/interface/views/bottom_nav_bar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String url = 'https://www.svgrepo.com/show/379983/connection-signal-wifi.svg';

  @override
  void initState() {
    super.initState();
    checkInternetAndNavigate();
  }

  Future<void> checkInternetAndNavigate() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Get.offAll(() => const InternetErrorPage());
    } else {
      Timer(
        const Duration(seconds: 6),
        () => Get.offAll(() => const BottomNavBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qwhite,
      body: SafeArea(
        child: Center(
          child: SvgPicture.asset(
            StaticClass.logo,
            height: 140,
            width: 140,
            // color: qblue,
          ),
        ),
      ),
    );
  }
}
