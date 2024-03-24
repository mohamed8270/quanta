import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/pages/chat_page.dart';
import 'package:quanta/pages/home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quanta',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: qblue,
          brightness: Brightness.light,
          primary: qblue,
        ),
        useMaterial3: true,
      ),
      routes: {
        "homepage": (c) => const HomePage(),
        "chatpage": (c) => const ChatPage(),
      },
      home: const HomePage(),
    );
  }
}
