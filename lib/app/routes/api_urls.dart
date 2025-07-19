class ApiUrls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String signUp = '$_baseUrl/auth/signup';
  static const String verifyOtp = '$_baseUrl/auth/verify-otp';
  static const String resendOtp = '$_baseUrl/auth/resend-otp';
  static const String login = '$_baseUrl/auth/login';
  static const String profile = '$_baseUrl/auth/profile';
  static const String slides = '$_baseUrl/slides';
  static const String addToCart = '$_baseUrl/cart';
  static const String products = '$_baseUrl/products';
  static const String cartItemList = '$_baseUrl/cart';
  static const String productDetails = '$_baseUrl/products/id/:product_id';
  static const String wishList = '$_baseUrl/wishlist';
  static const String removeFromCart = '$_baseUrl/cart/:cart_item_id';
  static const String removeFromWishList =
      '$_baseUrl/wishlist/:wishlist_item_id';
  static const String reviews = '$_baseUrl/reviews';

  static String categoryListUrl(int page, int count) =>
      '$_baseUrl/categories?count=$count&page=$page';
}
