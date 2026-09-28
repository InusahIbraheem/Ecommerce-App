class Product {
  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.categoryId,
    required this.rating,
    required this.reviewCount,
    required this.isFeatured,
    required this.colors,
    required this.sizes,
    required this.stock,
  });

  final String id;
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final String categoryId;
  final double rating;
  final int reviewCount;
  final bool isFeatured;
  final List<String> colors;
  final List<String> sizes;
  final int stock;

  bool get hasDiscount => originalPrice > price;

  double get discountPercent =>
      hasDiscount ? ((originalPrice - price) / originalPrice * 100) : 0;
}
