import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/bindings/controllers/connectivity_check.dart';
import 'package:quanta/bindings/controllers/network_dependency_injection.dart';
import 'package:quanta/routes/wrapper/wrapper.dart';
import 'package:quanta/utils/device/system_chrome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SysChromeMethod.systemUImode();
  SysChromeMethod.systemUIoverlay();
  Get.put(ConnectivityController());
  NetworkDependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrapper();
  }
}
