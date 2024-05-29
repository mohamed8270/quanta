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
          const SettingsPrefWidgets(txt: 'Preferences'),
          SettingsWidgetShape(
            boxcolor: qwhite,
            txt: 'Notification',
            leading: StaticClass.notification,
            actions: '',
            txtcolor: qblack,
            click: () {},
          ),
          const Divider(height: 1, thickness: 1, color: qgrey),
          SettingsWidgetShape(
            boxcolor: qwhite,
            txt: 'Permissions',
            leading: StaticClass.permission,
            actions: '',
            txtcolor: qblack,
            click: () {},
          ),
          const Divider(height: 1, thickness: 1, color: qgrey),
          SettingsWidgetShape(
            boxcolor: qwhite,
            txt: 'Privacy',
            leading: StaticClass.privacy,
            actions: '',
            txtcolor: qblack,
            click: () {},
          ),
          const SettingsPrefWidgets(txt: 'Advanced'),
          SettingsWidgetShape(
            boxcolor: qwhite,
            txt: 'Feedback',
            leading: StaticClass.feedback,
            actions: '',
            txtcolor: qblack,
            click: () {},
          ),
          const Divider(height: 1, thickness: 1, color: qgrey),
          SettingsWidgetShape(
            boxcolor: qwhite,
            txt: 'About',
            leading: StaticClass.about,
            actions: '',
            txtcolor: qblack,
            click: () {},
          ),
        ],
      ),
    );
  }
}
