import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:quanta/common/styles/theme.dart';

class StaticClass {
  // text
  static String heroGreeting = 'Start harvesting your money here';
  static String heroGreeting2 = 'Make a wise decission with';
  static String heroGreeting3 = 'Info Harvest';
  static String heroGreeting4 =
      'The powerful tool present in the market for the user to make price decission well, Unlock the potential of saving money over every order you make!';

  // icons
  static String homeOutline = 'assets/icons/home-outline.svg';
  static String homeFilled = 'assets/icons/home-filled.svg';
  static String amazonOutline = 'assets/icons/amazon-outline.svg';
  static String amazonFilled = 'assets/icons/amazon-filled.svg';
  static String saleOutline = 'assets/icons/sale-outline.svg';
  static String saleFilled = 'assets/icons/sale-filled.svg';
  static String profileOutline = 'assets/icons/profile-outline.svg';
  static String profileFilled = 'assets/icons/profile-filled.svg';

  static String wifi = 'assets/icons/wifi.svg';
  static String logo = 'assets/icons/logo.svg';
  static String notification =
      'https://www.svgrepo.com/show/498259/notification-bing.svg';
  static String permission =
      'https://www.svgrepo.com/show/526581/lock-password.svg';
  static String privacy = 'https://www.svgrepo.com/show/526657/shield-user.svg';
  static String feedback = 'https://www.svgrepo.com/show/498514/user-edit.svg';
  static String about =
      'https://www.svgrepo.com/show/324204/about-information-info-help.svg';
  static String tag = 'https://www.svgrepo.com/show/498463/tag-2.svg';
  static String graph = 'https://www.svgrepo.com/show/527104/graph-new-up.svg';
  static String uparrow = 'https://www.svgrepo.com/show/497735/arrow-up-2.svg';
  static String downarrow =
      'https://www.svgrepo.com/show/497716/arrow-down-2.svg';

  // padding
  static double p1 = 5;
  static double p2 = 10;
  static double p3 = 15;
  static double p4 = 20;
  static double p5 = 25;
  static double p6 = 30;

  // Spaces
  static Gap gap0 = const Gap(5);
  static Gap gap1 = const Gap(10);
  static Gap gap2 = const Gap(15);
  static Gap gap3 = const Gap(20);
  static Gap gap4 = const Gap(30);
  static Gap gap5 = const Gap(80);

  // bottom nav bar icons
  Widget outlineSvg(asset) {
    return SvgPicture.asset(
      asset,
      height: 24,
      width: 24,
      colorFilter: const ColorFilter.mode(qblack, BlendMode.srcIn),
    );
  }

  Widget filledSvg(asset) {
    return SvgPicture.asset(
      asset,
      height: 24,
      width: 24,
      colorFilter: const ColorFilter.mode(qblack, BlendMode.srcIn),
    );
  }
}
