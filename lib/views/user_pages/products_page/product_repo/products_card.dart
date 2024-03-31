import 'package:flutter/material.dart';
import 'package:quanta/constants/theme.dart';

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

    String offerCheck(off) {
      if (off == '0') {
        return 'One day offer available!';
      } else if (off != null) {
        return 'off $off%';
      }
      return 'No offer!';
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: click,
        child: Container(
          height: screenSize.height * 0.38,
          width: screenSize.width * 0.95,
          decoration: BoxDecoration(
            color: qwhite,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: qgrey.withOpacity(0.7), width: 1.5),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenSize.height * 0.25,
                  width: screenSize.width * 0.85,
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
                ThemeClass.space1,
                SizedBox(
                  width: screenSize.width * 0.85,
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeClass.heading3,
                  ),
                ),
                Text(
                  brand,
                  style: ThemeClass.brandName,
                ),
                ThemeClass.space1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                          child: Text(
                            offerCheck(offer),
                            style: ThemeClass.offerTxt,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '$symbol $price',
                      style: ThemeClass.heading4,
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
