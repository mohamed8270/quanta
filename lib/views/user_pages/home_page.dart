// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/components/gen_ai_greet.dart';
import 'package:quanta/components/widgets/appbar_widget.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/interface/reusable/user_input_box.dart';
import 'package:quanta/service/database/mongo_db.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final MongoDBclass mongoDBclass = Get.put(MongoDBclass());
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: qwhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/447866/ai-mi-algorithm.svg',
          leadingcolor: qblack,
          txt: 'Quanta',
          actions: [],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.height * 0.45,
            width: screenSize.width,
            color: Colors.transparent,
            child: Padding(
              padding: ThemeClass.padding0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ThemeClass.heroGreeting, style: ThemeClass.heading6),
                  Text(ThemeClass.heroGreeting2,
                      style: ThemeClass.heroGreetingTxt),
                  ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                            colors: [qorange, qyellow],
                            tileMode: TileMode.mirror,
                          ).createShader(bounds),
                      child: Text(ThemeClass.heroGreeting3,
                          style: ThemeClass.heroGreetingTxt2)),
                  ThemeClass.space0,
                  Text(ThemeClass.heroGreeting4, style: ThemeClass.heading5),
                  ThemeClass.space1,
                  UserSearchInput(
                    txt: 'Enter amazon link',
                    controller: searchController,
                    click: () {
                      setState(() {
                        loading = true;
                      });
                      mongoDBclass.insertproductURL(searchController.text);
                      setState(() {
                        loading = false;
                      });
                    },
                    isLoading: loading,
                  )
                ],
              ),
            ),
          ),
          ThemeClass.space1,
          const GenAiIntroBox(),
        ],
      ),
    );
  }
}
