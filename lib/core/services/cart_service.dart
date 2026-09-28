import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';
import '../models/product.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal =>
      _items.fold(0, (sum, item) => sum + item.totalPrice);

  double get shipping => _items.isEmpty ? 0 : 5.99;

  double get tax => subtotal * 0.08;

  double get total => subtotal + shipping + tax;

  bool isInCart(String productId) =>
      _items.any((item) => item.product.id == productId);

  void addItem(Product product, {String? color, String? size}) {
    final existingIndex = _items.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.selectedColor == (color ?? product.colors.first) &&
          item.selectedSize == (size ?? product.sizes.first),
    );

    if (existingIndex >= 0) {
      final existing = _items[existingIndex];
      _items[existingIndex] = existing.copyWith(
        quantity: existing.quantity + 1,
      );
    } else {
      _items.add(
        CartItem(
          product: product,
          quantity: 1,
          selectedColor: color ?? product.colors.first,
          selectedSize: size ?? product.sizes.first,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    if (quantity <= 0) {
      removeItem(item);
      return;
    }
    final index = _items.indexOf(item);
    if (index >= 0) {
      _items[index] = item.copyWith(quantity: quantity);
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
