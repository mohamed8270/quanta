import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/bindings/models/mongodb_models.dart';
import 'package:quanta/common/styles/animations/mongo_data_shimmer.dart';
import 'package:quanta/data/service/http_client.dart';
import 'package:quanta/routes/pages/products_page/product_detail_page.dart';
import 'package:quanta/routes/pages/products_page/product_repo/products_card.dart';

class GetSimilarProductsRepo extends StatelessWidget {
  const GetSimilarProductsRepo({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final MongoDBclass mongoDBclass = Get.put(MongoDBclass());
    return FutureBuilder<List<SimilarProductsModel>>(
      future: mongoDBclass.fetchSimilarProducts(id),
      builder: (BuildContext context,
          AsyncSnapshot<List<SimilarProductsModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MongoDataShimmer();
        } else if (snapshot.hasData) {
          List<SimilarProductsModel>? similarmodel = snapshot.data;
          return SizedBox(
            height: screenSize.height * 0.22,
            width: screenSize.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: similarmodel!.length,
              itemBuilder: (context, index) {
                final data = similarmodel[index];
                return ProductCardRepo(
                  click: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(id: data.id.toString()),
                    ),
                  ),
                  imgurl: data.image.toString(),
                  title: data.title.toString(),
                  offer: data.discountPercentage.toString(),
                  price: data.currentPrice.toString(),
                  brand: data.brand.toString(),
                  symbol: data.currency.toString(),
                );
              },
            ),
          );
        }
        return const Text('Server Busy');
      },
    );
  }
}
