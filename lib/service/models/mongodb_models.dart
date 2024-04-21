class MongoDBmodel {
  final String? id;
  final String? url;
  final int averagePrice;
  final String? brand;
  final String? category;
  final String? createdAt;
  final String? currency;
  final int currentPrice;
  final String? description;
  final int discountPercentage;
  final int highestPrice;
  final String? isOutOfStock;
  final int lowestPrice;
  final double originalPrice;
  final int reviewsCount;
  final String? title;
  final String? image;
  final String? updatedAt;

  MongoDBmodel(
      {this.id,
      this.url,
      required this.averagePrice,
      this.brand,
      this.category,
      this.createdAt,
      this.currency,
      required this.currentPrice,
      this.description,
      required this.discountPercentage,
      required this.highestPrice,
      this.isOutOfStock,
      required this.lowestPrice,
      required this.originalPrice,
      required this.reviewsCount,
      this.title,
      this.image,
      this.updatedAt});

  factory MongoDBmodel.fromJson(Map<String, dynamic> json) {
    // print(json['currentPrice']);
    // print(json['averagePrice']);
    // print(json['discoutPercentage']);
    // print(json['highestPrice']);
    // print(json['lowestPrice']);
    // print(json['originalPrice']);
    // print(json['reviewsCount']);
    return MongoDBmodel(
      id: (json['_id'] as String?)?.toString(),
      url: (json['url'] as String?)?.toString(),
      averagePrice: json['averagePrice'],
      brand: (json['brand'] as String?)?.toString(),
      category: (json['category'] as String?)?.toString(),
      createdAt: (json['createdAt'] as String?)?.toString(),
      currency: (json['currency'] as String?)?.toString(),
      currentPrice: json['currentPrice'],
      description: (json['description'] as String?)?.toString(),
      discountPercentage: json['discoutPercentage'],
      highestPrice: json['highestPrice'],
      isOutOfStock: (json['isOutOfStock'] as String?)?.toString(),
      lowestPrice: json['lowestPrice'],
      originalPrice: json['originalPrice'] != null
          ? json['originalPrice'].toDouble()
          : 0.0,
      reviewsCount: json['reviewsCount'],
      title: (json['title'] as String?)?.toString(),
      image: (json['image'] as String?)?.toString(),
      updatedAt: (json['updatedAt'] as String?)?.toString(),
    );
  }
}

class ProductDetailModel {
  final String? id;
  final String? url;
  final int averagePrice;
  final String? brand;
  final String? category;
  final String? createdAt;
  final String? currency;
  final int currentPrice;
  final String? description;
  final int discountPercentage;
  final int highestPrice;
  final String? isOutOfStock;
  final int lowestPrice;
  final double originalPrice;
  final int reviewsCount;
  final String? title;
  final String? image;
  final String? updatedAt;

  ProductDetailModel(
      {this.id,
      this.url,
      required this.averagePrice,
      this.brand,
      this.category,
      this.createdAt,
      this.currency,
      required this.currentPrice,
      this.description,
      required this.discountPercentage,
      required this.highestPrice,
      this.isOutOfStock,
      required this.lowestPrice,
      required this.originalPrice,
      required this.reviewsCount,
      this.title,
      this.image,
      this.updatedAt});

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      id: (json['_id'] as String?)?.toString(),
      url: (json['url'] as String?)?.toString(),
      averagePrice: json['averagePrice'],
      brand: (json['brand'] as String?)?.toString(),
      category: (json['category'] as String?)?.toString(),
      createdAt: (json['createdAt'] as String?)?.toString(),
      currency: (json['currency'] as String?)?.toString(),
      currentPrice: json['currentPrice'],
      description: (json['description'] as String?)?.toString(),
      discountPercentage: json['discoutPercentage'],
      highestPrice: json['highestPrice'],
      isOutOfStock: (json['isOutOfStock'] as String?)?.toString(),
      lowestPrice: json['lowestPrice'],
      originalPrice: json['originalPrice'] != null
          ? json['originalPrice'].toDouble()
          : 0.0,
      reviewsCount: json['reviewsCount'],
      title: (json['title'] as String?)?.toString(),
      image: (json['image'] as String?)?.toString(),
      updatedAt: (json['updatedAt'] as String?)?.toString(),
    );
  }
}

class SimilarProductsModel {
  final String? id;
  final String? url;
  final int averagePrice;
  final String? brand;
  final String? category;
  final String? createdAt;
  final String? currency;
  final int currentPrice;
  final String? description;
  final int discountPercentage;
  final int highestPrice;
  final String? isOutOfStock;
  final int lowestPrice;
  final double originalPrice;
  final int reviewsCount;
  final String? title;
  final String? image;
  final String? updatedAt;

  SimilarProductsModel(
      {this.id,
      this.url,
      required this.averagePrice,
      this.brand,
      this.category,
      this.createdAt,
      this.currency,
      required this.currentPrice,
      this.description,
      required this.discountPercentage,
      required this.highestPrice,
      this.isOutOfStock,
      required this.lowestPrice,
      required this.originalPrice,
      required this.reviewsCount,
      this.title,
      this.image,
      this.updatedAt});

  factory SimilarProductsModel.fromJson(Map<String, dynamic> json) {
    // print(json['currentPrice']);
    // print(json['averagePrice']);
    // print(json['discoutPercentage']);
    // print(json['highestPrice']);
    // print(json['lowestPrice']);
    // print(json['originalPrice']);
    // print(json['reviewsCount']);
    return SimilarProductsModel(
      id: (json['_id'] as String?)?.toString(),
      url: (json['url'] as String?)?.toString(),
      averagePrice: json['averagePrice'],
      brand: (json['brand'] as String?)?.toString(),
      category: (json['category'] as String?)?.toString(),
      createdAt: (json['createdAt'] as String?)?.toString(),
      currency: (json['currency'] as String?)?.toString(),
      currentPrice: json['currentPrice'],
      description: (json['description'] as String?)?.toString(),
      discountPercentage: json['discoutPercentage'],
      highestPrice: json['highestPrice'],
      isOutOfStock: (json['isOutOfStock'] as String?)?.toString(),
      lowestPrice: json['lowestPrice'],
      originalPrice: json['originalPrice'] != null
          ? json['originalPrice'].toDouble()
          : 0.0,
      reviewsCount: json['reviewsCount'],
      title: (json['title'] as String?)?.toString(),
      image: (json['image'] as String?)?.toString(),
      updatedAt: (json['updatedAt'] as String?)?.toString(),
    );
  }
}
