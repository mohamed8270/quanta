import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/components/widgets/appbar_widget.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/interface/views/animations/linear_progess_shimmer.dart';
import 'package:quanta/service/database/mongo_db.dart';
import 'package:quanta/service/models/mongodb_models.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;
  ProductDetailPage({super.key, required this.id});
  final MongoDBclass mongoDBclass = Get.put(MongoDBclass());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/488764/arrow-back.svg',
          txt: 'Product Details',
          actions: const [],
          leadingcolor: qblack,
          leadingClick: () => Get.back(),
        ),
      ),
      body: FutureBuilder<ProductDetailModel>(
          future: mongoDBclass.fetchProductDetail(id),
          builder: (BuildContext context,
              AsyncSnapshot<ProductDetailModel> snapshot) {
            final data = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LinearProgressShimmer();
            } else if (snapshot.hasData) {
              return Text(
                data!.title.toString(),
              );
            }
            return const Text('Server Busy');
          }),
    );
  }
}
