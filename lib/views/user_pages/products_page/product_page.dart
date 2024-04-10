import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/components/widgets/appbar_widget.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/interface/views/animations/linear_progess_shimmer.dart';
// import 'package:quanta/interface/views/animations/mongo_data_shimmer.dart';
import 'package:quanta/service/database/mongo_db.dart';
import 'package:quanta/service/models/mongodb_models.dart';
import 'package:quanta/views/user_pages/products_page/product_detail_page.dart';
import 'package:quanta/views/user_pages/products_page/product_repo/products_card.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final MongoDBclass mongoDBclass = Get.put(MongoDBclass());

  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: qwhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/448823/product-blink.svg',
          leadingcolor: qblack,
          txt: 'Track Products',
          actions: [],
        ),
      ),
      body: FutureBuilder<List<MongoDBmodel>>(
        future: mongoDBclass.fetchMongoDB(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MongoDBmodel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LinearProgressShimmer();
          } else if (snapshot.hasData) {
            List<MongoDBmodel>? mongoData = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mongoData!.length,
              itemBuilder: (context, index) {
                final data = mongoData[index];
                return ProductCardRepo(
                  click: () =>
                      Get.to(ProductDetailPage(id: data.id.toString())),
                  imgurl: data.image.toString(),
                  title: data.title.toString(),
                  offer: data.discountPercentage.toString(),
                  price: data.currentPrice.toString(),
                  brand: data.brand.toString(),
                  symbol: data.currency.toString(),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Text('Server Busy');
        },
      ),
    );
  }
}
