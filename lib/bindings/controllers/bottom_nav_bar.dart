// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';
import 'package:quanta/routes/pages/deals_page/deals_view.dart';
import 'package:quanta/routes/pages/home_page.dart';
import 'package:quanta/routes/pages/products_page/product_page.dart';
import 'package:quanta/routes/pages/profile_page/profile_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigateControl = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: qgrey,
                width: 0.7,
              ),
            ),
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
                labelTextStyle: MaterialStateTextStyle.resolveWith((state) {
              if (state.contains(MaterialState.selected)) {
                return GoogleFonts.poppins(
                  color: qblack,
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                );
              }
              return GoogleFonts.poppins(
                color: qblack,
                fontSize: 9,
                fontWeight: FontWeight.w500,
              );
            })),
            child: NavigationBar(
              height: 55,
              elevation: 0,
              backgroundColor: qwhite,
              selectedIndex: navigateControl.selectedIndex.value,
              onDestinationSelected: (index) =>
                  navigateControl.selectedIndex.value = index,
              indicatorColor: qwhite,
              surfaceTintColor: qwhite,
              destinations: [
                Column(
                  children: [
                    BottomTopBox(
                      isSelected: navigateControl.selectedIndex.value == 0,
                    ),
                    SizedBox(
                      height: 50,
                      child: NavigationDestination(
                        icon: StaticClass().outlineSvg(StaticClass.homeOutline),
                        selectedIcon:
                            StaticClass().filledSvg(StaticClass.homeFilled),
                        label: 'Home',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    BottomTopBox(
                      isSelected: navigateControl.selectedIndex.value == 1,
                    ),
                    SizedBox(
                      height: 50,
                      child: NavigationDestination(
                        icon:
                            StaticClass().outlineSvg(StaticClass.amazonOutline),
                        selectedIcon: SvgPicture.asset(StaticClass.amazonFilled,
                            height: 24, width: 24),
                        label: 'Products',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    BottomTopBox(
                      isSelected: navigateControl.selectedIndex.value == 2,
                    ),
                    SizedBox(
                      height: 50,
                      child: NavigationDestination(
                        icon: StaticClass().outlineSvg(StaticClass.saleOutline),
                        selectedIcon:
                            StaticClass().filledSvg(StaticClass.saleFilled),
                        label: 'Deals',
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    BottomTopBox(
                      isSelected: navigateControl.selectedIndex.value == 3,
                    ),
                    SizedBox(
                      height: 50,
                      child: NavigationDestination(
                        icon: StaticClass()
                            .outlineSvg(StaticClass.profileOutline),
                        selectedIcon:
                            StaticClass().filledSvg(StaticClass.profileFilled),
                        label: 'Profile',
                      ),
                    ),
                  ],
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

class BottomTopBox extends StatelessWidget {
  const BottomTopBox({super.key, required this.isSelected, this.child});

  final bool isSelected;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(5)),
        border: Border(
          top: BorderSide(
            width: 5,
            color: isSelected ? qblack : qwhite,
          ),
        ),
      ),
      child: child,
    );
  }
}

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    ProductPage(),
    const DealsPage(),
    const ProfilePage(),
  ];
}
