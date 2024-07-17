import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/bindings/models/mongodb_models.dart';
import 'package:quanta/common/styles/animations/linear_progess_shimmer.dart';
import 'package:quanta/common/styles/theme.dart';
import 'package:quanta/common/widgets/reusable/appbar_widget.dart';
import 'package:quanta/data/service/http_client.dart';
import 'package:quanta/routes/pages/products_page/product_repo/product_details_repo.dart';


class ProductDetailPage extends StatelessWidget {
  final String id;
  ProductDetailPage({super.key, required this.id});
  final MongoDBclass mongoDBclass = Get.put(MongoDBclass());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: qwhite,
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
        builder:
            (BuildContext context, AsyncSnapshot<ProductDetailModel> snapshot) {
          final data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressShimmer();
          } else if (snapshot.hasData) {
            return ProductDetailsRepo(
              id: data!.id.toString(),
              title: data.title.toString(),
              url: data.url.toString(),
              averagePrice: data.averagePrice.toString(),
              brand: data.brand.toString(),
              category: data.category.toString(),
              currency: data.currency.toString(),
              currentPrice: data.currentPrice.toString(),
              description: data.description.toString(),
              discountPercentage: data.discountPercentage.toString(),
              highestPrice: data.highestPrice.toString(),
              isOutOfStock: data.isOutOfStock.toString(),
              lowestPrice: data.lowestPrice.toString(),
              originalPrice: data.originalPrice.toString(),
              reviewsCount: data.reviewsCount.toString(),
              image: data.image.toString(),
              updatedAt: data.updatedAt.toString(),
              createdAt: data.createdAt.toString(),
            );
          }
          return const Text('Server Busy');
        },
      ),
    );
  }
}
