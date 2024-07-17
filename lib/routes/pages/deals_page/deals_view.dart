import 'package:flutter/material.dart';
import 'package:quanta/common/styles/theme.dart';
import 'package:quanta/common/widgets/reusable/appbar_widget.dart';

class DealsPage extends StatelessWidget {
  const DealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: qwhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/529449/cart-check.svg',
          leadingcolor: qblack,
          txt: 'Best Deals',
          actions: [],
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
