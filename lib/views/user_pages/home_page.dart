// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quanta/components/widgets/appbar_widget.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/interface/reusable/user_input_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
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
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('chatpage'),
        backgroundColor: qblack,
        elevation: 0,
        child: SvgPicture.network(
          'https://www.svgrepo.com/show/529062/magic-stick-3.svg',
          height: 28,
          width: 28,
          color: qwhite,
        ),
      ),
      body: Padding(
        padding: ThemeClass.padding0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ThemeClass.heroGreeting, style: ThemeClass.heading6),
            Text(ThemeClass.heroGreeting2, style: ThemeClass.heroGreetingTxt),
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
              click: () {},
            )
          ],
        ),
      ),
    );
  }
}
