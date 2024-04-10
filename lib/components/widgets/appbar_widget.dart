// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quanta/constants/theme.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.leading,
    required this.txt,
    required this.actions,
    required this.leadingcolor,
    this.leadingClick,
  });

  final String leading;
  final Color leadingcolor;
  final String txt;
  final List<Widget> actions;
  final VoidCallback? leadingClick;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: qwhite,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: qgrey,
              width: 0.7,
            ),
          ),
        ),
      ),
      centerTitle: false,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.all(12),
        child: GestureDetector(
          onTap: leadingClick,
          child: SvgPicture.network(
            leading,
            height: 16,
            width: 16,
            color: leadingcolor,
          ),
        ),
      ),
      title: Text(
        txt,
        style: ThemeClass.heading1,
      ),
      actions: actions,
    );
  }
}
