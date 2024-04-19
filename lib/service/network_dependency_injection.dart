import 'package:get/get.dart';
import 'package:quanta/service/connectivity_check.dart';

class NetworkDependencyInjection {
  static void init() {
    Get.put<ConnectivityController>(ConnectivityController(), permanent: true);
  }
}
