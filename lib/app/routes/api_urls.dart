class ApiUrls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String signUp = '$_baseUrl/auth/signup';
  static const String verifyOtp = '$_baseUrl/auth/verify-otp';
  static const String resendOtp = '$_baseUrl/auth/resend-otp';
  static const String login = '$_baseUrl/auth/login';
  static const String profile = '$_baseUrl/auth/profile';
  static const String slides = '$_baseUrl/slides';
  static const String addToCartUrl = '$_baseUrl/cart';

  static String categoryListUrl(int page, int count) =>
      '$_baseUrl/categories?count=$count&page=$page';
  static String productListByCategoryUrl(
    int count,
    int currentPage,
    String categoryId,
  ) => '$_baseUrl/products?count=$count&page=$currentPage&category=$categoryId';
  static String productsByTagUrl(String tag) => '$_baseUrl/products?tag=$tag';

  static String productDetailsUrl(String productId) =>
      '$_baseUrl/products/id/$productId';
}
