import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';
import 'package:quanta/common/widgets/interface/dialogue_box.dart';
import 'package:quanta/common/widgets/reusable/expandable_text.dart';
import 'package:quanta/routes/pages/products_page/product_repo/product_price_card.dart';
import 'package:quanta/routes/pages/products_page/product_repo/similar_product_repo/similar_product_repo.dart';
import 'package:quanta/utils/view/text_view.dart';

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
    var text = TextClass();
    var filter = Filter();

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StaticClass.gap1,
            Row(
              children: [
                text.textWidget(
                    brand, 8.0, TextClass.w5, qblack.withOpacity(0.5)),
                text.textWidget(
                    reviewsCount, 8.0, TextClass.w5, qblack.withOpacity(0.5)),
              ],
            ),
            StaticClass.gap0,
            text.textWidget(title, 10.0, TextClass.w5, qblack,
                TextOverflow.visible, 1.5, TextAlign.justify),
            StaticClass.gap1,
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                height: screenSize.height * 0.03,
                // width: screenSize.width * 0.2,
                decoration: const BoxDecoration(color: qred),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: text.textWidget(filter.offerCheck(discountPercentage),
                      12.0, TextClass.w6, qwhite),
                ),
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
            StaticClass.gap2,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                text.textWidget(
                    discountPercentage == '0' ? '' : '-$discountPercentage%',
                    32.0,
                    TextClass.w4,
                    qred),
                StaticClass.gap2,
                const SizedBox(
                  height: 60,
                  child: VerticalDivider(thickness: 2, width: 2, color: qgrey),
                ),
                StaticClass.gap2,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text.textWidget(currency, 12.0, TextClass.w5, qblack),
                        text.textWidget(filter.formatPrice(currentPrice), 32.0,
                            TextClass.w5, qblack),
                      ],
                    ),
                    Row(
                      children: [
                        text.textWidget('M.R.P', 10.0, TextClass.w6, qblack),
                        StaticClass.gap0,
                        Text(
                          '₹ ${filter.formatPrice(originalPrice)}',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: qblack,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            StaticClass.gap1,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductPriceCard(
                  nametxt: 'Current Price',
                  icn: StaticClass.tag,
                  pricetxt: filter.formatPrice(currentPrice),
                ),
                StaticClass.gap0,
                ProductPriceCard(
                  nametxt: 'Average Price',
                  icn: StaticClass.graph,
                  pricetxt: filter.formatPrice(averagePrice),
                ),
              ],
            ),
            StaticClass.gap0,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductPriceCard(
                  nametxt: 'Highest Price',
                  icn: StaticClass.uparrow,
                  pricetxt: filter.formatPrice(highestPrice),
                ),
                StaticClass.gap0,
                ProductPriceCard(
                  nametxt: 'Lowest Price',
                  icn: StaticClass.downarrow,
                  pricetxt: filter.formatPrice(lowestPrice),
                ),
              ],
            ),
            StaticClass.gap1,
            GestureDetector(
              onTap: () => DialogueBoxClass().mailDialogueBox(context, id),
              child: Container(
                height: screenSize.height * 0.06,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: qyellow,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: text.textWidget('Track', 14.0, TextClass.w6, qwhite),
              ),
            ),
            StaticClass.gap3,
            text.textWidget('Description', 14.0, TextClass.w6, qblack),
            StaticClass.gap0,
            ExpandableText(
              maxLines: 800,
              minLines: 7,
              text: filter.cleanDescription(description),
            ),
            StaticClass.gap1,
            text.textWidget('Similar Products', 14.0, TextClass.w6, qblack),
            GetSimilarProductsRepo(id: id),
            const Gap(100),
          ],
        ),
      ),
    );
  }
}
