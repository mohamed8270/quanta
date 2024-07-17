import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';

class ProductCardRepo extends StatelessWidget {
  const ProductCardRepo(
      {super.key,
      required this.imgurl,
      required this.title,
      required this.offer,
      required this.price,
      required this.brand,
      required this.symbol,
      required this.click});

  final String imgurl;
  final String title;
  final String offer;
  final String price;
  final String symbol;
  final String brand;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    var text = TextClass();

    String offerCheck(off) {
      if (off == '0') {
        return 'Limited time deal!';
      } else if (off != null) {
        return '$off% off';
      }
      return 'No offer!';
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
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: click,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: screenSize.height * 0.21,
          width: screenSize.width * 0.95,
          decoration: BoxDecoration(
            color: qgrey.withOpacity(0.25),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: qgrey.withOpacity(0.7), width: 1.5),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: screenSize.height * 0.25,
                  width: screenSize.width * 0.35,
                  decoration: BoxDecoration(
                    color: qwhite,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(imgurl),
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                StaticClass.gap1,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.5,
                      child: text.textWidget(title, 11.0, TextClass.w5, qblack,
                          TextOverflow.ellipsis, 1.5, TextAlign.start, 3),
                    ),
                    StaticClass.gap0,
                    text.textWidget(
                        brand, 8.0, TextClass.w5, qblack.withOpacity(0.5)),
                    StaticClass.gap1,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text.textWidget(symbol, 12.0, TextClass.w5, qblack),
                        text.textWidget(
                            formatPrice(price), 22.0, TextClass.w5, qblack),
                      ],
                    ),
                    StaticClass.gap0,
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Container(
                        height: screenSize.height * 0.03,
                        // width: screenSize.width * 0.2,
                        decoration: BoxDecoration(
                          color: qgreen,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: text.textWidget(
                              offerCheck(offer), 10.0, TextClass.w5, qwhite),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
