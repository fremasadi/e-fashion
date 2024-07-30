class OrderDetail {
  final int id;
  final int userId;
  final int productId;
  int quantity;
  final double price;
  final String size;
  final String color;
  final DateTime createdAt;

  OrderDetail({
    required this.id,
    required this.userId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.size,
    required this.color,
    required this.createdAt,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      productId: json['product_id'] ?? 0,
      quantity: json['quantity'] ?? 0,
      price: (json['price'] as num).toDouble(),
      size: json['size'] ?? '',
      color: json['color'] ?? '',
      createdAt: DateTime.parse(
          json['created_at'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'product_id': productId,
      'quantity': quantity,
      'price': price,
      'size': size,
      'color': color,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
