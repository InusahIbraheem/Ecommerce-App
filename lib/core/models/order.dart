enum OrderStatus { processing, shipped, delivered, cancelled }

class OrderItem {
  const OrderItem({
    required this.productId,
    required this.productName,
    required this.imageUrl,
    required this.quantity,
    required this.price,
  });

  final String productId;
  final String productName;
  final String imageUrl;
  final int quantity;
  final double price;
}

class Order {
  const Order({
    required this.id,
    required this.items,
    required this.total,
    required this.status,
    required this.createdAt,
    required this.deliveryAddress,
  });

  final String id;
  final List<OrderItem> items;
  final double total;
  final OrderStatus status;
  final DateTime createdAt;
  final String deliveryAddress;

  String get statusLabel {
    return switch (status) {
      OrderStatus.processing => 'Processing',
      OrderStatus.shipped => 'Shipped',
      OrderStatus.delivered => 'Delivered',
      OrderStatus.cancelled => 'Cancelled',
    };
  }
}
