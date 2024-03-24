import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  static ConnectivityController get to => Get.find<ConnectivityController>();

  final Connectivity _connectivity = Connectivity();
  final Rx<ConnectivityResult> connectionStatus = Rx(ConnectivityResult.none);

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
    connectionStatus.listen((connectivity) {
      if (connectivity != ConnectivityResult.none) {
        navigateToHomePage();
      }
    });
  }

  Future<void> checkConnectivity() async {
    final List<ConnectivityResult> connectivityResults =
        await (_connectivity.checkConnectivity());
    ConnectivityResult connectionStatus = connectivityResults.isNotEmpty
        ? connectivityResults.first
        : ConnectivityResult.none;

    this.connectionStatus.value = connectionStatus;
  }

  void navigateToHomePage() {
    Timer(const Duration(seconds: 20), () {
      Get.toNamed("bottomnavbar");
    });
  }
}
