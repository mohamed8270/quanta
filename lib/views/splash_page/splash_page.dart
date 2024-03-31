// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/service/connectivity_check.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final ConnectivityController networkConnectivity =
      Get.find<ConnectivityController>();

  final String url =
      'https://www.svgrepo.com/show/379983/connection-signal-wifi.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qwhite,
      body: SafeArea(
        child: Center(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.network(
                  'https://www.svgrepo.com/show/303264/amazon-2-logo.svg',
                  height: 140,
                  width: 140,
                  // color: qblue,
                ),
                ThemeClass.space1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    networkConnectivity.connectionStatus.value ==
                            ConnectionState.none
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                              color: qyellow,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              strokeCap: StrokeCap.round,
                              strokeWidth: 2,
                            ),
                          )
                        : SvgPicture.network(
                            url,
                            height: 14,
                            width: 14,
                            color: qgreen,
                          ),
                    ThemeClass.space1,
                    Text(
                      networkConnectivity.connectionStatus.value ==
                              ConnectionState.none
                          ? 'Checking Network'
                          : 'Connected',
                      style: ThemeClass.heading5,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
