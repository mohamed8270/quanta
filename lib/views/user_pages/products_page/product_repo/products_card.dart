import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:quanta/constants/theme.dart';

class ProductCardRepo extends StatelessWidget {
  const ProductCardRepo(
      {super.key,
      required this.imgurl,
      required this.title,
      required this.offer,
      required this.price,
      required this.brand,
      required this.symbol});

  final String imgurl;
  final String title;
  final String offer;
  final String price;
  final String symbol;
  final String brand;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * 0.4,
      width: screenSize.width * 0.95,
      decoration: BoxDecoration(
        color: qgrey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.3,
              width: screenSize.width * 0.85,
              decoration: BoxDecoration(
                color: qgrey.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imgurl),
                  fit: BoxFit.cover,
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
            ThemeClass.space0,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(
                    height: screenSize.height * 0.03,
                    decoration: BoxDecoration(
                      color: qred,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      offer,
                      style: ThemeClass.offerTxt,
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
    );
  }
}
