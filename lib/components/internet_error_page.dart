import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/interface/views/bottom_nav_bar.dart';

class InternetErrorPage extends StatefulWidget {
  const InternetErrorPage({super.key});

  @override
  State<InternetErrorPage> createState() => _InternetErrorPageState();
}

class _InternetErrorPageState extends State<InternetErrorPage> {
  bool isRefreshed = false;

  Future<void> checkInternetAndNavigate() async {
    final result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      Get.offAll(() => const BottomNavBar());
    }
  }

  Future<void> handleRefresh() async {
    setState(() {
      isRefreshed = true;
    });
    await checkInternetAndNavigate();
    setState(() {
      isRefreshed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RefreshIndicator(
          onRefresh: handleRefresh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network(
                'https://www.svgrepo.com/show/379983/connection-signal-wifi.svg',
                height: 30,
                width: 30,
                color: qred,
              ),
              ThemeClass.space1,
              Text('Oops! no internet connection', style: ThemeClass.heading3),
              ThemeClass.space0,
              Text('Please connect to the internet!',
                  style: ThemeClass.heading2),
              Text('Pull down to refresh', style: ThemeClass.heading6),
            ],
          ),
        ),
      ),
    );
  }
}
