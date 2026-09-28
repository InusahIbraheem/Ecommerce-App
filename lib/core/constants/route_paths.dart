class RoutePaths {
  RoutePaths._();

  static const splash = '/';
  static const onboarding = '/onboarding';
  static const home = '/home';
  static const categories = '/categories';
  static const productDetails = '/product/:id';
  static const wishlist = '/wishlist';
  static const cart = '/cart';
  static const checkout = '/checkout';
  static const payment = '/payment';
  static const orders = '/orders';
  static const reviews = '/reviews/:id';
  static const notifications = '/notifications';
  static const profile = '/profile';
  static const settings = '/settings';

  static String productDetailsPath(String id) => '/product/$id';
  static String reviewsPath(String id) => '/reviews/$id';
}
