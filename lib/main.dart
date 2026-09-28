import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/constants/app_constants.dart';
import 'core/router/app_router.dart';
import 'core/services/cart_service.dart';
import 'core/services/wishlist_service.dart';
import 'core/theme/app_theme.dart';

void main() {
  final cartService = CartService();
  final wishlistService = WishlistService();

  runApp(
    EcommerceApp(
      cartService: cartService,
      wishlistService: wishlistService,
    ),
  );
}

class EcommerceApp extends StatefulWidget {
  const EcommerceApp({
    super.key,
    required this.cartService,
    required this.wishlistService,
  });

  final CartService cartService;
  final WishlistService wishlistService;

  @override
  State<EcommerceApp> createState() => _EcommerceAppState();
}

class _EcommerceAppState extends State<EcommerceApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = createRouter(
      cartService: widget.cartService,
      wishlistService: widget.wishlistService,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      routerConfig: _router,
    );
  }
}
