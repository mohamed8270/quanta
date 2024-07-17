import 'package:flutter/services.dart';
import 'package:quanta/common/styles/theme.dart';

class SysChromeMethod {
  static systemUImode() {
    return SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
  }

  static systemUIoverlay() {
    return SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: qwhite,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
