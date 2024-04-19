import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanta/constants/theme.dart';

class ProductPriceCard extends StatelessWidget {
  const ProductPriceCard(
      {super.key,
      required this.nametxt,
      required this.icn,
      required this.pricetxt});

  final String nametxt;
  final String icn;
  final String pricetxt;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: screenSize.height * 0.09,
      width: screenSize.width * 0.465,
      decoration: BoxDecoration(
        color: qgrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nametxt, style: ThemeClass.heading5),
            ThemeClass.space1,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.network(icn, height: 20, width: 20),
                ThemeClass.space0,
                Text('₹$pricetxt', style: ThemeClass.heading1)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
