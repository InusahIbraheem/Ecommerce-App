import '../models/category.dart';
import '../models/notification.dart';
import '../models/order.dart';
import '../models/product.dart';
import '../models/review.dart';
import '../models/user_profile.dart';

class MockDataService {
  MockDataService._();

  static final UserProfile currentUser = UserProfile(
    id: 'user_1',
    name: 'Inusah Ibraheem',
    email: 'inusah.ibraheem@example.com',
    phone: '+1 (555) 012-3456',
    avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200',
    address: '742 Evergreen Terrace, Springfield, IL 62704',
    memberSince: DateTime(2023, 3, 15),
  );

  static const List<Category> categories = [
    Category(
      id: 'cat_1',
      name: 'Electronics',
      icon: 'devices',
      imageUrl: 'https://images.unsplash.com/photo-1498049794561-7780e7231661?w=400',
      productCount: 48,
    ),
    Category(
      id: 'cat_2',
      name: 'Fashion',
      icon: 'checkroom',
      imageUrl: 'https://images.unsplash.com/photo-1445205170230-053b83016050?w=400',
      productCount: 86,
    ),
    Category(
      id: 'cat_3',
      name: 'Home',
      icon: 'chair',
      imageUrl: 'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400',
      productCount: 34,
    ),
    Category(
      id: 'cat_4',
      name: 'Beauty',
      icon: 'spa',
      imageUrl: 'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=400',
      productCount: 52,
    ),
    Category(
      id: 'cat_5',
      name: 'Sports',
      icon: 'fitness_center',
      imageUrl: 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=400',
      productCount: 29,
    ),
    Category(
      id: 'cat_6',
      name: 'Books',
      icon: 'menu_book',
      imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400',
      productCount: 64,
    ),
  ];

  static const List<Product> products = [
    Product(
      id: 'prod_1',
      name: 'Wireless Noise-Cancelling Headphones',
      description:
          'Premium over-ear headphones with adaptive noise cancellation, 30-hour battery life, and studio-quality sound for music lovers and professionals.',
      price: 249.99,
      originalPrice: 329.99,
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600',
      categoryId: 'cat_1',
      rating: 4.8,
      reviewCount: 1240,
      isFeatured: true,
      colors: ['Black', 'Silver', 'Navy'],
      sizes: ['One Size'],
      stock: 45,
    ),
    Product(
      id: 'prod_2',
      name: 'Minimalist Leather Sneakers',
      description:
          'Handcrafted leather sneakers with cushioned insoles and a timeless design that pairs effortlessly with any outfit.',
      price: 89.99,
      originalPrice: 119.99,
      imageUrl: 'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=600',
      categoryId: 'cat_2',
      rating: 4.6,
      reviewCount: 856,
      isFeatured: true,
      colors: ['White', 'Black', 'Tan'],
      sizes: ['7', '8', '9', '10', '11', '12'],
      stock: 120,
    ),
    Product(
      id: 'prod_3',
      name: 'Smart Watch Pro',
      description:
          'Advanced fitness tracking, heart rate monitoring, GPS, and seamless smartphone integration in a sleek aluminum body.',
      price: 399.00,
      originalPrice: 449.00,
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600',
      categoryId: 'cat_1',
      rating: 4.7,
      reviewCount: 2103,
      isFeatured: true,
      colors: ['Midnight', 'Starlight', 'Gold'],
      sizes: ['40mm', '44mm'],
      stock: 78,
    ),
    Product(
      id: 'prod_4',
      name: 'Ceramic Pour-Over Coffee Set',
      description:
          'Artisan ceramic dripper and carafe set for the perfect morning brew. Includes reusable filter and measuring scoop.',
      price: 54.99,
      originalPrice: 54.99,
      imageUrl: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=600',
      categoryId: 'cat_3',
      rating: 4.5,
      reviewCount: 312,
      isFeatured: false,
      colors: ['White', 'Matte Black'],
      sizes: ['One Size'],
      stock: 34,
    ),
    Product(
      id: 'prod_5',
      name: 'Organic Skincare Bundle',
      description:
          'A complete daily routine with cleanser, serum, and moisturizer made from sustainably sourced organic ingredients.',
      price: 68.00,
      originalPrice: 85.00,
      imageUrl: 'https://images.unsplash.com/photo-1556228578-0d85b7a88dff?w=600',
      categoryId: 'cat_4',
      rating: 4.9,
      reviewCount: 567,
      isFeatured: true,
      colors: ['Standard'],
      sizes: ['One Size'],
      stock: 90,
    ),
    Product(
      id: 'prod_6',
      name: 'Performance Running Shoes',
      description:
          'Lightweight mesh upper with responsive foam cushioning designed for long-distance comfort and speed.',
      price: 129.99,
      originalPrice: 159.99,
      imageUrl: 'https://images.unsplash.com/photo-1606107557195-0fa42b1b0a0d?w=600',
      categoryId: 'cat_5',
      rating: 4.4,
      reviewCount: 743,
      isFeatured: false,
      colors: ['Blue/Orange', 'Black/Green', 'Grey/Red'],
      sizes: ['7', '8', '9', '10', '11', '12'],
      stock: 55,
    ),
    Product(
      id: 'prod_7',
      name: 'Modern Desk Lamp',
      description:
          'Adjustable LED desk lamp with warm-to-cool color temperature control and touch dimming for focused work sessions.',
      price: 79.99,
      originalPrice: 99.99,
      imageUrl: 'https://images.unsplash.com/photo-1507473888944-44a079a0448c?w=600',
      categoryId: 'cat_3',
      rating: 4.3,
      reviewCount: 198,
      isFeatured: false,
      colors: ['White', 'Black'],
      sizes: ['One Size'],
      stock: 42,
    ),
    Product(
      id: 'prod_8',
      name: 'Classic Denim Jacket',
      description:
          'Vintage-inspired denim jacket with a relaxed fit, durable stitching, and soft washed finish for everyday wear.',
      price: 74.50,
      originalPrice: 95.00,
      imageUrl: 'https://images.unsplash.com/photo-1576995853123-5a10305d93b0?w=600',
      categoryId: 'cat_2',
      rating: 4.6,
      reviewCount: 421,
      isFeatured: false,
      colors: ['Light Wash', 'Dark Wash', 'Black'],
      sizes: ['S', 'M', 'L', 'XL'],
      stock: 67,
    ),
    Product(
      id: 'prod_9',
      name: 'Portable Bluetooth Speaker',
      description:
          'Water-resistant speaker with 360° sound, 12-hour playtime, and built-in microphone for hands-free calls.',
      price: 59.99,
      originalPrice: 79.99,
      imageUrl: 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=600',
      categoryId: 'cat_1',
      rating: 4.5,
      reviewCount: 934,
      isFeatured: true,
      colors: ['Charcoal', 'Coral', 'Teal'],
      sizes: ['One Size'],
      stock: 150,
    ),
    Product(
      id: 'prod_10',
      name: 'Bestseller Fiction Collection',
      description:
          'Curated set of five award-winning novels spanning contemporary fiction, mystery, and literary classics.',
      price: 45.00,
      originalPrice: 60.00,
      imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=600',
      categoryId: 'cat_6',
      rating: 4.7,
      reviewCount: 289,
      isFeatured: false,
      colors: ['Standard'],
      sizes: ['One Size'],
      stock: 200,
    ),
  ];

  static final List<Review> reviews = [
    Review(
      id: 'rev_1',
      productId: 'prod_1',
      userName: 'Sarah Mitchell',
      userAvatar: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100',
      rating: 5,
      comment:
          'Absolutely love these headphones! The noise cancellation is incredible and the battery lasts for days.',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Review(
      id: 'rev_2',
      productId: 'prod_1',
      userName: 'James Chen',
      userAvatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100',
      rating: 4,
      comment:
          'Great sound quality and comfortable for long sessions. Wish the case was slightly smaller.',
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Review(
      id: 'rev_3',
      productId: 'prod_2',
      userName: 'Emily Rodriguez',
      userAvatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100',
      rating: 5,
      comment: 'These sneakers are stylish and incredibly comfortable. Perfect everyday shoes.',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Review(
      id: 'rev_4',
      productId: 'prod_3',
      userName: 'Michael Brown',
      userAvatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100',
      rating: 4.5,
      comment: 'Best smartwatch I have owned. Fitness tracking is accurate and the display is gorgeous.',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
    ),
    Review(
      id: 'rev_5',
      productId: 'prod_5',
      userName: 'Lisa Park',
      userAvatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100',
      rating: 5,
      comment: 'My skin has never felt better. All products smell amazing and feel luxurious.',
      createdAt: DateTime.now().subtract(const Duration(hours: 12)),
    ),
  ];

  static final List<Order> orders = [
    Order(
      id: 'ORD-2024-001',
      items: const [
        OrderItem(
          productId: 'prod_1',
          productName: 'Wireless Noise-Cancelling Headphones',
          imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=200',
          quantity: 1,
          price: 249.99,
        ),
        OrderItem(
          productId: 'prod_9',
          productName: 'Portable Bluetooth Speaker',
          imageUrl: 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=200',
          quantity: 1,
          price: 59.99,
        ),
      ],
      total: 315.97,
      status: OrderStatus.delivered,
      createdAt: DateTime(2024, 11, 15),
      deliveryAddress: currentUser.address,
    ),
    Order(
      id: 'ORD-2024-002',
      items: const [
        OrderItem(
          productId: 'prod_2',
          productName: 'Minimalist Leather Sneakers',
          imageUrl: 'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=200',
          quantity: 1,
          price: 89.99,
        ),
      ],
      total: 95.98,
      status: OrderStatus.shipped,
      createdAt: DateTime(2024, 12, 3),
      deliveryAddress: currentUser.address,
    ),
    Order(
      id: 'ORD-2024-003',
      items: const [
        OrderItem(
          productId: 'prod_5',
          productName: 'Organic Skincare Bundle',
          imageUrl: 'https://images.unsplash.com/photo-1556228578-0d85b7a88dff?w=200',
          quantity: 2,
          price: 68.00,
        ),
      ],
      total: 142.00,
      status: OrderStatus.processing,
      createdAt: DateTime(2024, 12, 20),
      deliveryAddress: currentUser.address,
    ),
  ];

  static final List<AppNotification> notifications = [
    AppNotification(
      id: 'notif_1',
      title: 'Order Delivered',
      message: 'Your order ORD-2024-001 has been delivered successfully.',
      type: NotificationType.order,
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      isRead: false,
    ),
    AppNotification(
      id: 'notif_2',
      title: 'Flash Sale — 30% Off',
      message: 'Limited time offer on all electronics. Shop now before it ends!',
      type: NotificationType.promo,
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      isRead: false,
    ),
    AppNotification(
      id: 'notif_3',
      title: 'Order Shipped',
      message: 'Your order ORD-2024-002 is on its way. Track your package.',
      type: NotificationType.order,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
    AppNotification(
      id: 'notif_4',
      title: 'Welcome to ShopEase',
      message: 'Thanks for joining! Explore curated collections and exclusive deals.',
      type: NotificationType.system,
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
      isRead: true,
    ),
    AppNotification(
      id: 'notif_5',
      title: 'New Arrivals in Fashion',
      message: 'Check out the latest seasonal styles handpicked for you.',
      type: NotificationType.promo,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
      isRead: true,
    ),
  ];

  static Product? getProductById(String id) {
    try {
      return products.firstWhere((product) => product.id == id);
    } catch (_) {
      return null;
    }
  }

  static Category? getCategoryById(String id) {
    try {
      return categories.firstWhere((category) => category.id == id);
    } catch (_) {
      return null;
    }
  }

  static List<Product> getProductsByCategory(String categoryId) {
    return products.where((product) => product.categoryId == categoryId).toList();
  }

  static List<Product> get featuredProducts =>
      products.where((product) => product.isFeatured).toList();

  static List<Review> getReviewsForProduct(String productId) {
    return reviews.where((review) => review.productId == productId).toList();
  }
}
