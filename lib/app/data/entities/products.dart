class Product {
  int id;
  String name;
  String type;
  String image;
  double originalPrice;
  double discountedPrice;
  double rating;
  int reviewCount;
  bool isOnSale;

  Product({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.originalPrice,
    required this.discountedPrice,
    required this.rating,
    required this.reviewCount,
    required this.isOnSale,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      image: json['image'],
      originalPrice: (json['original_price'] as num).toDouble(),
      discountedPrice: (json['discounted_price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['review_count'],
      isOnSale: json['is_on_sale'],
    );
  }
}
