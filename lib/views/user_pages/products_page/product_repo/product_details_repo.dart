import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:quanta/constants/theme.dart';
import 'package:quanta/interface/reusable/expandable_text.dart';
import 'package:quanta/views/user_pages/products_page/product_repo/product_price_card.dart';
import 'package:quanta/views/user_pages/products_page/product_repo/similar_product_repo/similar_product_repo.dart';

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

    String cleanDescription(String des) {
      return des.replaceAll('\n', '');
    }

    bool isNumeric(String str) {
      if (str.isEmpty) return false;
      return num.tryParse(str) != null;
    }

    String formatPrice(String priceString) {
      if (isNumeric(priceString)) {
        double price = double.parse(priceString);
        final formatter = NumberFormat('#,###,###,###.##');
        return formatter.format(price);
      } else {
        return priceString;
      }
    }

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
              height: screenSize.height * 0.03,
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
            ThemeClass.space2,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '-$discountPercentage%',
                  style: ThemeClass.detailDiscountPercentageTxt,
                ),
                ThemeClass.space2,
                Text(
                  currency,
                  style: ThemeClass.symbolTxt,
                ),
                Text(
                  formatPrice(currentPrice),
                  style: ThemeClass.detailPriceTxt,
                ),
              ],
            ),
            ThemeClass.space0,
            Row(
              children: [
                Text(
                  'M.R.P',
                  style: ThemeClass.heading3,
                ),
                ThemeClass.space0,
                Text(
                  '₹ ${formatPrice(originalPrice)}',
                  style: ThemeClass.detailMrpTxt,
                ),
              ],
            ),
            ThemeClass.space1,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductPriceCard(
                  nametxt: 'Current Price',
                  icn: 'https://www.svgrepo.com/show/498463/tag-2.svg',
                  pricetxt: formatPrice(currentPrice),
                ),
                ThemeClass.space0,
                ProductPriceCard(
                  nametxt: 'Average Price',
                  icn: 'https://www.svgrepo.com/show/527104/graph-new-up.svg',
                  pricetxt: formatPrice(averagePrice),
                ),
              ],
            ),
            ThemeClass.space0,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductPriceCard(
                  nametxt: 'Highest Price',
                  icn: 'https://www.svgrepo.com/show/497735/arrow-up-2.svg',
                  pricetxt: formatPrice(highestPrice),
                ),
                ThemeClass.space0,
                ProductPriceCard(
                  nametxt: 'Lowest Price',
                  icn: 'https://www.svgrepo.com/show/497716/arrow-down-2.svg',
                  pricetxt: formatPrice(lowestPrice),
                ),
              ],
            ),
            ThemeClass.space1,
            GestureDetector(
              onTap: () {},
              child: Container(
                height: screenSize.height * 0.06,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: qyellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text('Track Now', style: ThemeClass.buttonTxt),
              ),
            ),
            ThemeClass.space3,
            Text('Description', style: ThemeClass.heading3),
            ThemeClass.space0,
            // Text(
            //   cleanDescription(description),
            //   textAlign: TextAlign.justify,
            //   style: ThemeClass.detailDescriptionTxt,
            // ),
            ExpandableText(
              maxLines: 800,
              minLines: 7,
              text: cleanDescription(description),
            ),
            ThemeClass.space1,
            Text('Similar Products', style: ThemeClass.heading3),
            GetSimilarProductsRepo(id: id),
            const Gap(100),
          ],
        ),
      ),
    );
  }
}
