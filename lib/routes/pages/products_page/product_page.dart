import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/bindings/models/mongodb_models.dart';
import 'package:quanta/common/styles/animations/linear_progess_shimmer.dart';
import 'package:quanta/common/styles/theme.dart';
import 'package:quanta/common/widgets/interface/snack_bar.dart';
import 'package:quanta/common/widgets/reusable/appbar_widget.dart';
import 'package:quanta/data/service/http_client.dart';
import 'package:quanta/routes/pages/products_page/product_detail_page.dart';
import 'package:quanta/routes/pages/products_page/product_repo/products_card.dart';

// import 'package:quanta/interface/views/animations/mongo_data_shimmer.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final MongoDBclass mongoDBclass = Get.put(MongoDBclass());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: qwhite,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/529449/cart-check.svg',
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
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      // mainAxisSpacing: 8,
                      childAspectRatio:
                          screenSize.width / screenSize.height * 1.3),
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
                  }),
            );
          } else if (snapshot.hasError) {
            return SnackBarClass()
                .errorSnack404(context, snapshot.error.toString());
          }
          return const Text('Server Busy');
        },
      ),
    );
  }
}
