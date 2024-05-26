import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanta/constants/theme.dart';

class HomePageUserWidget extends StatelessWidget {
  const HomePageUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back!', style: ThemeClass.heading7),
              Text('Mohamed Ibrahim', style: ThemeClass.heading2),
            ],
          ),
          SvgPicture.network(
            'https://www.svgrepo.com/show/498259/notification-bing.svg',
            height: 22,
            width: 22,
            colorFilter: const ColorFilter.mode(qblack, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
