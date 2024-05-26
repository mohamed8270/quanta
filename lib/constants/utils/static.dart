import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanta/constants/theme.dart';

class StaticClass {
  // text
  static String heroGreeting = 'Start harvesting your money here';
  static String heroGreeting2 = 'Make a wise decission with';
  static String heroGreeting3 = 'Info Harvest & Quanta';
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
