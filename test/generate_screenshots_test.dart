import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ecommerce_ui/core/theme/app_theme.dart';
import 'package:ecommerce_ui/screens/onboarding_screen.dart';
import 'package:ecommerce_ui/screens/home_screen.dart';
import 'package:ecommerce_ui/screens/categories_screen.dart';
import 'package:ecommerce_ui/screens/product_details_screen.dart';
import 'package:ecommerce_ui/screens/cart_screen.dart';
import 'package:ecommerce_ui/screens/checkout_screen.dart';
import 'package:ecommerce_ui/screens/payment_screen.dart';
import 'package:ecommerce_ui/screens/wishlist_screen.dart';
import 'package:ecommerce_ui/screens/orders_screen.dart';
import 'package:ecommerce_ui/screens/reviews_screen.dart';
import 'package:ecommerce_ui/screens/profile_screen.dart';
import 'package:ecommerce_ui/screens/notifications_screen.dart';
import 'package:ecommerce_ui/screens/settings_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('Generate high-res screenshots for Ecommerce UI App', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;

    final screens = <String, Widget>{
      '01_onboarding': const EcommerceOnboardingScreen(),
      '02_home': const HomeScreen(),
      '03_categories': const CategoriesScreen(),
      '04_product_details': const ProductDetailsScreen(),
      '05_cart': const CartScreen(),
      '06_checkout': const CheckoutScreen(),
      '07_payment': const PaymentScreen(),
      '08_wishlist': const WishlistScreen(),
      '09_orders': const OrdersScreen(),
      '10_reviews': const ReviewsScreen(),
      '11_profile': const ProfileScreen(),
      '12_notifications': const NotificationsScreen(),
      '13_settings': const SettingsScreen(),
    };

    final dir = Directory('screenshots');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    for (final entry in screens.entries) {
      final repaintBoundaryKey = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: RepaintBoundary(
            key: repaintBoundaryKey,
            child: entry.value,
          ),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      final boundary = repaintBoundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: 2.0);
          final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
          if (byteData != null) {
            final pngBytes = byteData.buffer.asUint8List();
            final file = File('screenshots/${entry.key}.png');
            await file.writeAsBytes(pngBytes);
            // ignore: avoid_print
            print('Saved screenshot: screenshots/${entry.key}.png (${pngBytes.length} bytes)');
          }
        });
      }
    }
  });
}
