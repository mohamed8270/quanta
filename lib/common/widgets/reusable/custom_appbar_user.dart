import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanta/common/styles/theme.dart';

class HomePageUserWidget extends StatelessWidget {
  const HomePageUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var text = TextClass();
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text.textWidget(
                  'Welcome back!', 10.0, TextClass.w5, qblack.withOpacity(0.5)),
              text.textWidget('Mohamed Ibrahim', 16.0, TextClass.w6, qblack),
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
