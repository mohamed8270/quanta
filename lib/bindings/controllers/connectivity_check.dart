// ignore_for_file: deprecated_member_use

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';

class ConnectivityController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var text = TextClass();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: text.textWidget(
            'Please connect to internet', 14.0, TextClass.w6, qwhite),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: qred,
        icon: SvgPicture.asset(
          StaticClass.wifi,
          height: 16,
          width: 16,
          color: qwhite,
        ),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
