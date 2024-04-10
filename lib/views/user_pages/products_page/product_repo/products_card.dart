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
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: screenSize.height * 0.2,
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
                ThemeClass.space1,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.5,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: ThemeClass.titleTxt,
                      ),
                    ),
                    Text(
                      brand,
                      style: ThemeClass.brandName,
                    ),
                    ThemeClass.space1,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          symbol,
                          style: ThemeClass.symbolTxt,
                        ),
                        Text(
                          price,
                          style: ThemeClass.priceTxt,
                        ),
                      ],
                    ),
                    ThemeClass.space0,
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
