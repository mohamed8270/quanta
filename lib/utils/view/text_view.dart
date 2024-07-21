import 'package:intl/intl.dart';

class Filter {
  // description
  String cleanDescription(String des) {
    return des.replaceAll('\n', '');
  }

  // numeric or not
  bool isNumeric(String str) {
    if (str.isEmpty) return false;
    return num.tryParse(str) != null;
  }

  // format price
  String formatPrice(String priceString) {
    if (isNumeric(priceString)) {
      double price = double.parse(priceString);
      final formatter = NumberFormat('#,###,###,###.##');
      return formatter.format(price);
    } else {
      return priceString;
    }
  }

  // offer check
  String offerCheck(off) {
    if (off == '0') {
      return 'Limited Stock!';
    } else if (off != null) {
      return '- $off%';
    }
    return 'No offer!';
  }
}
