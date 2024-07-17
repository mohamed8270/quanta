import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanta/common/styles/static.dart';
import 'package:quanta/common/styles/theme.dart';

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
    var text = TextClass();
    return Container(
      height: screenSize.height * 0.095,
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
            text.textWidget(nametxt, 10.0, TextClass.w6, qblack),
            StaticClass.gap1,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.network(
                  icn,
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(qblack, BlendMode.srcIn),
                ),
                StaticClass.gap0,
                text.textWidget('₹$pricetxt', 18.0, TextClass.w6, qblack),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
