// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/components/custom_shapes/round_stack.dart';
import 'package:quanta/components/widgets/custom_appbar_user.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: screenSize.height * 0.58,
              width: screenSize.width,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    top: -150,
                    right: -150,
                    child: RoundStackWidget(
                      height: 400,
                      width: 400,
                      radius: 400,
                      padding: 0,
                      // bgColor: qyellow.withOpacity(0.06),
                      borderColor: qgrey.withOpacity(0.7),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: -200,
                    child: RoundStackWidget(
                      height: 300,
                      width: 300,
                      radius: 300,
                      padding: 0,
                      // bgColor: qyellow.withOpacity(0.05),
                      borderColor: qyellow.withOpacity(0.2),
                    ),
                  ),
                  Padding(
                    padding: ThemeClass.padding0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomePageUserWidget(),
                        Text(ThemeClass.heroGreeting,
                            style: ThemeClass.heading6),
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
                        Text(ThemeClass.heroGreeting4,
                            style: ThemeClass.heading5),
                        ThemeClass.space1,
                        UserSearchInput(
                          txt: 'Enter amazon link',
                          controller: searchController,
                          click: () async {
                            setState(() {
                              loading = true;
                            });
                            await mongoDBclass
                                .insertproductURL(searchController.text);
                            setState(() {
                              loading = false;
                            });
                          },
                          isLoading: loading,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ThemeClass.space1,
          ],
        ),
      ),
    );
  }
}
