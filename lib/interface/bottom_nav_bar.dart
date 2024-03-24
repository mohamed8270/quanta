// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/pages/home_page.dart';
import 'package:quanta/pages/product_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final screens = [
    const HomePage(),
    const ProductPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: qblack.withOpacity(0.3),
              width: 0.15,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: qwhite,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          iconSize: 18,
          currentIndex: currentIndex,
          selectedLabelStyle: GoogleFonts.poppins(
            color: currentIndex == 1 ? qblack : qyellow,
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: qblack.withOpacity(0.3),
          selectedItemColor: currentIndex == 1 ? qblack : qyellow,
          unselectedLabelStyle: GoogleFonts.poppins(
            color: qblack.withOpacity(0.3),
            fontSize: 10,
            fontWeight: FontWeight.w500,
            height: 1.5,
          ),
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/524643/home-angle-2.svg',
                color: qblack.withOpacity(0.3),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/525378/home-angle-2.svg',
                color: qyellow,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/475634/amazon-color.svg',
                height: 24,
                width: 24,
                color: qblack.withOpacity(0.3),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/475634/amazon-color.svg',
                height: 24, width: 24,
                // color: qblue,
              ),
              label: 'Products',
            ),
          ],
        ),
      ),
    );
  }
}
