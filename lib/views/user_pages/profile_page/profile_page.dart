import 'package:flutter/material.dart';
import 'package:quanta/components/widgets/appbar_widget.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/constants/utils/static.dart';
import 'package:quanta/interface/reusable/settings_widget_box.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qgrey,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/527439/settings.svg',
          leadingcolor: qblack,
          txt: 'Account Settings',
          actions: [],
        ),
      ),
      body: Column(
        children: [
          SettingsWidgetShape(
            boxcolor: qwhite,
            txt: 'Notification',
            leading: StaticClass.notification,
            actions: 'Hello',
            txtcolor: qblack,
            click: () {},
          ),
        ],
      ),
    );
  }
}
