import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quanta/constants/theme.dart';

class GenAiIntroBox extends StatelessWidget {
  const GenAiIntroBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * 0.2,
      width: screenSize.width,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Padding(
        padding: ThemeClass.padding0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [qblue, qorange],
                tileMode: TileMode.mirror,
              ).createShader(bounds),
              child: Text(
                'Super charge your ideas with Gemini AI',
                style: ThemeClass.genAiTxt,
              ),
            ),
            ThemeClass.space1,
            GestureDetector(
              onTap: () => Get.toNamed('chatpage'),
              child: Container(
                height: screenSize.height * 0.045,
                width: screenSize.width * 0.3,
                decoration: BoxDecoration(
                    color: qgrey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: qblue, width: 1.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.network(
                      'https://www.svgrepo.com/show/529062/magic-stick-3.svg',
                      height: 18,
                      width: 18,
                      colorFilter:
                          const ColorFilter.mode(qblue, BlendMode.srcIn),
                    ),
                    ThemeClass.space1,
                    Text('Chat now', style: ThemeClass.heading5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
