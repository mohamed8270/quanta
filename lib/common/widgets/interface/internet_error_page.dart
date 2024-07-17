// ignore_for_file: deprecated_member_use

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quanta/bindings/controllers/bottom_nav_bar.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';

class InternetErrorPage extends StatefulWidget {
  const InternetErrorPage({super.key});

  @override
  State<InternetErrorPage> createState() => _InternetErrorPageState();
}

class _InternetErrorPageState extends State<InternetErrorPage> {
  bool isRefreshed = false;

  Future<void> checkInternetAndNavigate() async {
    final result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      Get.offAll(() => const BottomNavBar());
    }
  }

  Future<void> handleRefresh() async {
    setState(() {
      isRefreshed = true;
    });
    await checkInternetAndNavigate();
    setState(() {
      isRefreshed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var text = TextClass();
    return Scaffold(
      body: Center(
        child: RefreshIndicator(
          onRefresh: handleRefresh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network(
                'https://www.svgrepo.com/show/379983/connection-signal-wifi.svg',
                height: 30,
                width: 30,
                color: qred,
              ),
              StaticClass.gap1,
              text.textWidget(
                  'Oops! no internet connection', 14.0, TextClass.w6, qblack),
              StaticClass.gap0,
              text.textWidget(
                  'Please connect to the internet', 16.0, TextClass.w6, qwhite),
              text.textWidget('Pull down to refresh', 8.0, TextClass.w5,
                  qblack.withOpacity(0.5)),
            ],
          ),
        ),
      ),
    );
  }
}
