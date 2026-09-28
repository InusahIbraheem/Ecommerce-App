import 'package:flutter/foundation.dart';

import '../models/product.dart';

class WishlistService extends ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  bool isWishlisted(String productId) =>
      _items.any((product) => product.id == productId);

  void toggle(Product product) {
    if (isWishlisted(product.id)) {
      _items.removeWhere((item) => item.id == product.id);
    } else {
      _items.add(product);
    }
    notifyListeners();
  }

  void remove(String productId) {
    _items.removeWhere((item) => item.id == productId);
    notifyListeners();
  }
}
