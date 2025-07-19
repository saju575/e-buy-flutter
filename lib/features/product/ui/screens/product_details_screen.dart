import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/colors/app_colors.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/app/widgets/global_loading.dart';
import 'package:e_buy/app/widgets/increment_decrement_button.dart';
import 'package:e_buy/features/cart/domain/models/cart_add_request_model.dart';
import 'package:e_buy/features/cart/ui/controllers/cart_controller.dart';
import 'package:e_buy/features/product/ui/controllers/product_details_controller.dart';
import 'package:e_buy/features/product/ui/widgets/color_picker.dart';
import 'package:e_buy/features/product/ui/widgets/product_size_select.dart';
import 'package:e_buy/features/product/ui/widgets/slider_card.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:e_buy/features/wish_list/ui/controllers/wish_list_controller.dart';
import 'package:e_buy/middlewares/login_middleware.dart';
import 'package:e_buy/utils/empty_placeholder.dart';
import 'package:e_buy/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();

  static const String name = "productDetailsScreen";
  final String id;
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      Get.find<ProductDetailsController>();
  final WishListController _wishlistController = Get.find<WishListController>();
  final CartController _cartController = Get.find<CartController>();

  late ValueNotifier<int> _quantity;

  late ValueNotifier<String?> _selectedSize;
  late ValueNotifier<String?> _selectedColor;

  @override
  void initState() {
    super.initState();
    _quantity = ValueNotifier(1);
    _selectedSize = ValueNotifier(null);
    _selectedColor = ValueNotifier(null);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productDetailsController.getProductDetails(widget.id);
    });
  }

  @override
  void dispose() {
    _quantity.dispose();
    _selectedColor.dispose();
    _selectedSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textStyle = context.textStyle;
    final colors = context.colors;
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows body behind AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40), // Set your custom height
        child: AppBar(
          backgroundColor: Colors.black.withOpacity(0.15),
          title: const Text('Product Details', style: TextStyle(fontSize: 16)),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (productDetailsContext) {
          final productDetails = productDetailsContext.productDetails;
          if (productDetailsContext.productDetails?.sizes?.isNotEmpty == true) {
            _selectedSize.value = productDetails?.sizes?.first;
          }
          if (productDetailsContext.productDetails?.colors?.isNotEmpty ==
              true) {
            _selectedColor.value = productDetails?.colors?.first;
          }
          return GlobalLoading(
            isLoading: productDetailsContext.loading,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _renderCarouselSlider(
                          colors,
                          screenHeight,
                          productDetails?.photos?.isNotEmpty == true
                              ? productDetails!.photos!
                              : [EmptyPlaceholder.image],
                        ),
                        const SizedBox(height: 14),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _renderTitle(
                                textStyle,
                                colors,
                                productDetailsContext,
                              ),
                              const SizedBox(height: 8),
                              _renderRatingAndReview(colors, textStyle),
                              const SizedBox(height: 14),
                              _renderHeading(
                                textStyle: textStyle,
                                colors: colors,
                                title: "Colors",
                              ),
                              const SizedBox(height: 6),
                              _renderColors(productDetailsContext),
                              const SizedBox(height: 14),
                              _renderHeading(
                                textStyle: textStyle,
                                colors: colors,
                                title: "Size",
                              ),
                              const SizedBox(height: 6),
                              _renderSizes(productDetailsContext),
                              const SizedBox(height: 14),
                              _renderHeading(
                                textStyle: textStyle,
                                colors: colors,
                                title: "Description",
                              ),
                              const SizedBox(height: 6),
                              Text(
                                productDetailsContext
                                        .productDetails
                                        ?.description ??
                                    "",
                                style: textStyle.sm.copyWith(
                                  color: colors.bodyText,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GetBuilder<CartController>(
                  builder: (cartAddContext) {
                    return BottomPurchaseBar(
                      title: "Price",
                      price: productDetails?.currentPrice != null
                          ? productDetails?.currentPrice ?? 0
                          : productDetails?.regularPrice ?? 0,
                      buttonText: "Add to Cart",
                      onTapButton: () {
                        _handleAddToCart(
                          id: widget.id,
                          quantity: _quantity.value,
                          size: _selectedSize.value,
                          color: _selectedColor.value,
                        );
                      },
                      loading: cartAddContext.addToCartLoading,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _renderHeading({
    required String title,
    required TextStyleTokens textStyle,
    required AppColors colors,
  }) {
    return Text(
      title,
      style: textStyle.lg.copyWith(
        color: colors.heading,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _renderCarouselSlider(
    AppColors colors,
    double screenHeight,
    List<String> images,
  ) {
    return AppCarouselSlider<String>(
      indicatorActiveColor: colors.primary,
      showIndicatorOnTop: true,
      height: screenHeight / 3,
      items: images,
      sliderCardBuilder: (width, height, index, item) => SliderCard(
        item: item,
        width: width,
        height: height,
        index: index,
        enablePadding: false,
      ),
    );
  }

  Widget _renderTitle(
    TextStyleTokens textStyle,
    AppColors colors,
    ProductDetailsController productDetailsContext,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Text(
            productDetailsContext.productDetails?.title ?? "",
            style: textStyle.lg.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.heading,
            ),
            maxLines: 2,
          ),
        ),
        Spacer(),
        ValueListenableBuilder(
          valueListenable: _quantity,
          builder: (context, value, child) {
            return IncrementDecrementButton(
              value: value,
              onChange: (value) {
                _quantity.value = value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _renderRatingAndReview(AppColors colors, TextStyleTokens textStyle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIcon(iconName: AppIcons.star, color: colors.warning),
        SizedBox(width: 2),
        Text("4.5", style: textStyle.base.copyWith(color: colors.bodyText)),
        SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            _moveToReviewScreen(widget.id);
          },
          child: Text(
            "Reviews",
            style: textStyle.base.copyWith(color: colors.primary),
          ),
        ),
        SizedBox(width: 16),
        AppIconButton(
          width: 24,
          height: 24,
          icon: AppIcon(
            iconName: AppIcons.heartOutline,
            color: colors.bodyText,
            size: 18,
          ),
          onTap: () {
            _handleAddToWishList(widget.id);
          },
        ),
      ],
    );
  }

  Widget _renderColors(ProductDetailsController productDetailsContext) {
    return ValueListenableBuilder<String?>(
      valueListenable: _selectedColor,
      builder: (context, value, child) {
        return Visibility(
          visible:
              productDetailsContext.productDetails?.colors?.isNotEmpty ?? false,
          child: ColorPicker(
            colors: productDetailsContext.productDetails?.colors ?? [],
            onSelected: (color) {
              _selectedColor.value = color;
            },
          ),
        );
      },
    );
  }

  Widget _renderSizes(ProductDetailsController productDetailsContext) {
    return Visibility(
      visible: productDetailsContext.productDetails?.sizes?.isNotEmpty ?? false,
      child: ProductSizeSelect(
        sizeList: productDetailsContext.productDetails?.sizes ?? [],
        onChange: (value) {
          _selectedSize.value = value;
        },
        selectedSize: _selectedSize.value,
      ),
    );
  }

  void _moveToReviewScreen(String id) {
    Navigator.pushNamed(context, AppRoutes.reviews, arguments: id);
  }

  Future<void> _handleAddToWishList(String id) async {
    guardRoute(
      context: context,
      onAllowed: () async {
        final result = await _wishlistController.addToWishlist(productId: id);
        if (!mounted) {
          return;
        }
        if (result) {
          ToastUtil.show(message: "Added to wishlist", context: context);
        } else {
          ToastUtil.show(
            message: _wishlistController.addToWishlistErrorMessage,
            context: context,
          );
        }
      },
      fallbackArguments: {"goBack": true},
    );
  }

  Future<void> _handleAddToCart({
    required String id,
    required int quantity,
    String? color,
    String? size,
  }) async {
    final requestBody = CartAddRequestModel(
      productId: id,
      quantity: quantity,
      color: color,
      size: size,
    );
    guardRoute(
      context: context,
      onAllowed: () async {
        final result = await _cartController.addToCart(
          requestBody: requestBody,
        );
        if (!mounted) {
          return;
        }
        if (result) {
          ToastUtil.show(message: "Added to cart", context: context);
        } else {
          ToastUtil.show(
            message: _cartController.addToCartErrorMessage,
            context: context,
          );
        }
      },
      fallbackArguments: {"goBack": true},
    );
  }
}
