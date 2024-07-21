import 'package:flutter/material.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';
import 'package:quanta/utils/view/text_view.dart';

class ProductCardRepo extends StatelessWidget {
  const ProductCardRepo(
      {super.key,
      required this.imgurl,
      required this.title,
      required this.offer,
      required this.price,
      required this.symbol,
      required this.brand,
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
    var filter = Filter();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: click,
        child: Container(
          height: screenSize.height * 0.4,
          width: screenSize.width,
          decoration: BoxDecoration(
            color: qgrey.withOpacity(0.25),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1.2, color: qgrey.withOpacity(0.7)),
          ),
          child: Column(
            children: [
              Container(
                height: screenSize.height * 0.18,
                width: screenSize.width,
                decoration: BoxDecoration(
                  color: qwhite,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(5)),
                  image: DecorationImage(
                    image: NetworkImage(imgurl),
                    fit: BoxFit.scaleDown,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Container(
                          height: screenSize.height * 0.03,
                          // width: screenSize.width * 0.2,
                          decoration: BoxDecoration(
                            color: qred,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: text.textWidget(filter.offerCheck(offer),
                                10.0, TextClass.w5, qwhite),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text.textWidget(
                        brand, 8.0, TextClass.w5, qblack.withOpacity(0.5)),
                    StaticClass.gap0,
                    SizedBox(
                      width: screenSize.width,
                      child: text.textWidget(title, 10.0, TextClass.w5, qblack,
                          TextOverflow.ellipsis, 1.5, TextAlign.start, 2),
                    ),
                    StaticClass.gap1,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text.textWidget(symbol, 12.0, TextClass.w5, qblack),
                        text.textWidget(filter.formatPrice(price), 22.0,
                            TextClass.w5, qblack),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
