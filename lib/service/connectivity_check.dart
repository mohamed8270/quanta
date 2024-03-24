import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Call checkConnectivity function on initialization
    checkConnectivity();
    // Listen for network connectivity changes
    Connectivity().onConnectivityChanged.listen((result) {
      checkConnectivity();
    });
  }

  void checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      isConnected.value = false;
    } else {
      isConnected.value = true;
      Get.toNamed('bottomnavbar');
    }
  }

  bool get isInternetConnected => isConnected.value;
}
