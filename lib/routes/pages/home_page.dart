// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';
import 'package:quanta/common/widgets/interface/graphics/round_stack.dart';
import 'package:quanta/common/widgets/reusable/custom_appbar_user.dart';
import 'package:quanta/common/widgets/reusable/user_input_box.dart';
import 'package:quanta/data/service/http_client.dart';

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
    var text = TextClass();
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
                    padding: EdgeInsets.only(
                        left: StaticClass.p2,
                        right: StaticClass.p2,
                        top: StaticClass.p4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const HomePageUserWidget(),
                        text.textWidget(StaticClass.heroGreeting, 8.0,
                            TextClass.w5, qblack.withOpacity(0.5)),
                        text.textWidget(StaticClass.heroGreeting2, 38.0,
                            TextClass.w7, qblack),
                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [qorange, qyellow],
                            tileMode: TileMode.mirror,
                          ).createShader(bounds),
                          child: text.textWidget(StaticClass.heroGreeting3,
                              38.0, TextClass.w7, qwhite),
                        ),
                        StaticClass.gap0,
                        text.textWidget(StaticClass.heroGreeting4, 10.0,
                            TextClass.w6, qblack),
                        StaticClass.gap1,
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
            StaticClass.gap1,
          ],
        ),
      ),
    );
  }
}
