import 'package:flutter/material.dart';
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
      height: screenSize.height * 0.15,
      width: screenSize.width,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50,
            right: -40,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(400),
                border: Border.all(color: qblue, width: 2),
              ),
            ),
          ),
          Positioned(
            top: 90,
            right: 20,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(400),
                border: Border.all(color: qgrey, width: 2),
              ),
            ),
          ),
          Positioned(
            top: -30,
            left: -50,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(400),
                border: Border.all(color: qgrey.withOpacity(0.3), width: 2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [qblue, qorange],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds),
                  child: Text(
                    'GenAI is here!',
                    style: ThemeClass.genAiTxt,
                  ),
                ),
                ThemeClass.space0,
                Text(
                  'Super charge your ideas with Gemini AI',
                  style: ThemeClass.heading7,
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
        ],
      ),
    );
  }
}
