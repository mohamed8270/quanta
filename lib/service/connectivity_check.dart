import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkConnectivity extends GetxController {
  final Rx<ConnectivityResult> connectivityResult = ConnectivityResult.none.obs;
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  void onInit() {
    super.onInit();
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      updateConnectionStatus(results.first);
    }) as StreamSubscription<ConnectivityResult>;
  }

  @override
  void onClose() {
    connectivitySubscription.cancel();
    super.onClose();
  }

  void updateConnectionStatus(ConnectivityResult result) {
    connectivityResult.value = result;
    if (result == ConnectivityResult.none) {
      Get.snackbar(
        '',
        '',
      );
    }
  }

  bool get isConnected => connectivityResult.value != ConnectivityResult.none;
}
