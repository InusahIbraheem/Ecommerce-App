import 'package:ecommerce_ui/main.dart';
import 'package:ecommerce_ui/core/services/cart_service.dart';
import 'package:ecommerce_ui/core/services/wishlist_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App loads splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      EcommerceApp(
        cartService: CartService(),
        wishlistService: WishlistService(),
      ),
    );

    expect(find.text('ShopEase'), findsOneWidget);
  });
}
