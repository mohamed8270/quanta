import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/bindings/controllers/bottom_nav_bar.dart';
import 'package:quanta/common/styles/theme.dart';
import 'package:quanta/routes/pages/home_page.dart';
import 'package:quanta/routes/pages/splash_page/splash_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quanta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: qyellow),
        useMaterial3: true,
      ),
      routes: {
        "homepage": (c) => const HomePage(),
        "bottomnavbar": (c) => const BottomNavBar(),
        "splashpage": (c) => const SplashPage(),
      },
      home: const SplashPage(),
    );
  }
}
