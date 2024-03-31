import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/interface/views/bottom_nav_bar.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/views/user_pages/chat_page.dart';
import 'package:quanta/views/user_pages/home_page.dart';
import 'package:quanta/views/splash_page/splash_page.dart';

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
        "chatpage": (c) => const ChatPage(),
        "homepage": (c) => const HomePage(),
        "bottomnavbar": (c) => const BottomNavBar(),
        "splashpage": (c) => const SplashPage(),
      },
      home: const SplashPage(),
    );
  }
}
