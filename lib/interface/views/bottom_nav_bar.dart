// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/views/user_pages/home_page.dart';
import 'package:quanta/views/user_pages/products_page/product_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigateControl = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: qblack.withOpacity(0.3),
                width: 0.2,
              ),
            ),
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: MaterialStateProperty.all(
                GoogleFonts.poppins(
                  color: qblack,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            child: NavigationBar(
              height: 80,
              elevation: 0,
              backgroundColor: qwhite,
              selectedIndex: navigateControl.selectedIndex.value,
              onDestinationSelected: (index) =>
                  navigateControl.selectedIndex.value = index,
              indicatorColor: qblack.withOpacity(0.035),
              destinations: [
                NavigationDestination(
                  icon: SvgPicture.network(
                    'https://www.svgrepo.com/show/498091/home.svg',
                    color: qblack,
                  ),
                  selectedIcon: SvgPicture.network(
                    'https://www.svgrepo.com/show/498091/home.svg',
                    color: qblack,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: SvgPicture.network(
                    'https://www.svgrepo.com/show/475634/amazon-color.svg',
                    height: 24,
                    width: 24,
                  ),
                  selectedIcon: SvgPicture.network(
                    'https://www.svgrepo.com/show/475634/amazon-color.svg',
                    height: 24,
                    width: 24,
                  ),
                  label: 'Products',
                ),
                NavigationDestination(
                  icon: SvgPicture.network(
                    'https://www.svgrepo.com/show/527424/sale.svg',
                  ),
                  selectedIcon: SvgPicture.network(
                    'https://www.svgrepo.com/show/527424/sale.svg',
                  ),
                  label: 'Deals',
                ),
                NavigationDestination(
                  icon: SvgPicture.network(
                    'https://www.svgrepo.com/show/498298/profile.svg',
                  ),
                  selectedIcon: SvgPicture.network(
                    'https://www.svgrepo.com/show/498298/profile.svg',
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => navigateControl.screens[navigateControl.selectedIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    ProductPage(),
    const HomePage(),
    const HomePage(),
  ];
}
