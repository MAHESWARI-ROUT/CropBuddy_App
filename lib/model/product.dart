class Product {
  final String name;
  final double price;
  final int quantity;
  final String category;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.quantity,
    required this.category,
    required this.imageUrl,
  });

  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      quantity: data['quantity-avaliable'] ?? 0,
      category: data['category'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }
}
