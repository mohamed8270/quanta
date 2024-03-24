import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quanta/constants/theme.dart';

class ShimmerLoadingAnimation extends StatelessWidget {
  const ShimmerLoadingAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenSize.width,
          height: screenSize.height * 0.02,
          color: qwhite,
        ),
        const Gap(15),
        Container(
          width: screenSize.width * 0.8,
          height: screenSize.height * 0.02,
          color: qwhite,
        ),
        const Gap(15),
        Container(
          width: screenSize.width * 0.6,
          height: screenSize.height * 0.02,
          color: qwhite,
        ),
        const Gap(15),
        Container(
          width: screenSize.width * 0.4,
          height: screenSize.height * 0.02,
          color: qwhite,
        ),
      ],
    );
  }
}
