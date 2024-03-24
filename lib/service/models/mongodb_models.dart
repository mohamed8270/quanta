class MongoDBmodel {
  final String id;
  final String url;
  final String averagePrice;
  final String brand;
  final String category;
  final String createdAt;
  final String currency;
  final String currentPrice;
  final String description;
  final String discountPercentage;
  final String highestPrice;
  final String isOutOfStock;
  final String lowestPrice;
  final String originalPrice;
  final String reviewsCount;
  final String title;
  final String image;
  final String updatedAt;

  MongoDBmodel(
      {required this.id,
      required this.url,
      required this.averagePrice,
      required this.brand,
      required this.category,
      required this.createdAt,
      required this.currency,
      required this.currentPrice,
      required this.description,
      required this.discountPercentage,
      required this.highestPrice,
      required this.isOutOfStock,
      required this.lowestPrice,
      required this.originalPrice,
      required this.reviewsCount,
      required this.title,
      required this.image,
      required this.updatedAt});

  factory MongoDBmodel.fromJson(Map<String, dynamic> json) {
    return MongoDBmodel(
      id: json['_id'],
      url: json['url'],
      averagePrice: json['averagePrice'],
      brand: json['brand'],
      category: json['category'],
      createdAt: json['createdAt'],
      currency: json['currency'],
      currentPrice: json['currentPrice'],
      description: json['description'],
      discountPercentage: json['discoutPercentage'],
      highestPrice: json['highestPrice'],
      isOutOfStock: json['isOutOfStock'],
      lowestPrice: json['lowestPrice'],
      originalPrice: json['originalPrice'],
      reviewsCount: json['reviewsCount'],
      title: json['title'],
      image: json['image'],
      updatedAt: json['updatedAt'],
    );
  }
}
