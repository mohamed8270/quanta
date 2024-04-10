import 'package:flutter/widgets.dart';
import 'package:quanta/constants/theme.dart';

class ProductDetailsRepo extends StatelessWidget {
  const ProductDetailsRepo(
      {super.key,
      required this.id,
      required this.title,
      required this.url,
      required this.averagePrice,
      required this.brand,
      required this.category,
      required this.currency,
      required this.currentPrice,
      required this.description,
      required this.discountPercentage,
      required this.highestPrice,
      required this.isOutOfStock,
      required this.lowestPrice,
      required this.originalPrice,
      required this.reviewsCount,
      required this.image,
      required this.updatedAt,
      required this.createdAt});

  final String id;
  final String title;
  final String url;
  final String averagePrice;
  final String brand;
  final String category;
  final String currency;
  final String currentPrice;
  final String description;
  final String discountPercentage;
  final String highestPrice;
  final String isOutOfStock;
  final String lowestPrice;
  final String originalPrice;
  final String reviewsCount;
  final String image;
  final String createdAt;
  final String updatedAt;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThemeClass.space1,
            Row(
              children: [
                Text(
                  brand,
                  style: ThemeClass.brandName,
                ),
                Text(
                  reviewsCount,
                  style: ThemeClass.brandName,
                ),
              ],
            ),
            ThemeClass.space0,
            Text(
              title,
              style: ThemeClass.titleTxt,
            ),
            ThemeClass.space1,
            Container(
              height: screenSize.height * 0.02,
              width: screenSize.width * 0.2,
              decoration: const BoxDecoration(color: qred),
              alignment: Alignment.center,
              child: Text(
                '$discountPercentage% off',
                style: ThemeClass.detailDiscountTxt,
              ),
            ),
            Container(
              height: screenSize.height * 0.3,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: qwhite,
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.fitHeight,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            ThemeClass.space1,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency,
                  style: ThemeClass.symbolTxt,
                ),
                Text(
                  currentPrice,
                  style: ThemeClass.detailPriceTxt,
                ),
              ],
            ),
            ThemeClass.space0,
            Text(
              'M.R.P: ₹$originalPrice',
              style: ThemeClass.heading5,
            ),
            ThemeClass.space1,
            Text(
              description,
              textAlign: TextAlign.justify,
              style: ThemeClass.heading4,
            ),
          ],
        ),
      ),
    );
  }
}
