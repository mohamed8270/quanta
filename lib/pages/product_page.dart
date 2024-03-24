import 'package:flutter/material.dart';
import 'package:quanta/components/appbar_widget.dart';
import 'package:quanta/constants/theme.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: qwhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/448823/product-blink.svg',
          txt: 'Amazon Products',
          actions: [],
        ),
      ),
    );
  }
}
