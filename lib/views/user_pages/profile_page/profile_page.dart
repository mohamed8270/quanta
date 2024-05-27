import 'package:flutter/material.dart';
import 'package:quanta/components/widgets/appbar_widget.dart';
import 'package:quanta/constants/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: qgrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/527439/settings.svg',
          leadingcolor: qblack,
          txt: 'Account Settings',
          actions: [],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
