import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanta/components/widgets/appbar_widget.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/interface/views/shimmer_loading.dart';
import 'package:quanta/service/database/mongo_db.dart';
import 'package:quanta/service/models/mongodb_models.dart';

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
          leading: 'https://www.svgrepo.com/show/448823/product-blink.svg',
          leadingcolor: qblack,
          txt: 'Track Products',
          actions: [],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: FutureBuilder<List<MongoDBmodel>>(
          future: mongoDBclass.fetchMongoDB(),
          builder: (BuildContext context,
              AsyncSnapshot<List<MongoDBmodel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ShimmerLoadingAnimation();
            } else if (snapshot.hasData) {
              List<MongoDBmodel>? mongoData = snapshot.data;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mongoData!.length,
                itemBuilder: (context, index) {
                  final data = mongoData[index];
                  return Text(
                    data.title.toString(),
                    style: ThemeClass.heading4,
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Text('');
          },
        ),
      ),
    );
  }
}
