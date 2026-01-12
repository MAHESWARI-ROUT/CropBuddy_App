class Product {
  final String name;
  final double price;
  final int quantityAvailable;
  final String category;
  final String imageUrl;
  final String description;
  final String unit;
  Product({
    required this.name,
    required this.price,
    required this.quantityAvailable,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.unit
  });

  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      quantityAvailable: (data['quantityAvailable'] ?? 0).toInt(),
      category: data['category'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      description: data['description']?? '',
      unit: data['unit']?? '',

    );
  }
}
