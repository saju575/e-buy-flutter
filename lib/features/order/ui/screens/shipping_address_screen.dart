import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/button.dart';
import 'package:e_buy/core/components/app_bottom_sheet.dart';
import 'package:e_buy/features/order/ui/controllers/order_controller.dart';
import 'package:e_buy/features/order/ui/widgets/place_order_modal.dart';
import 'package:e_buy/utils/toast_util.dart';
import 'package:e_buy/utils/uuid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key, required this.price});
  static const name = "shipping_address";
  final double price;
  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _postalCodeTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController =
      TextEditingController();

  final OrderController _orderController = Get.find<OrderController>();

  @override
  void dispose() {
    _addressTEController.dispose();
    _cityTEController.dispose();
    _postalCodeTEController.dispose();
    _phoneNumberTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;
    final colors = context.colors;

    return Scaffold(
      appBar: AppBar(title: const Text("Shipping Address"), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.only(top: 16, left: 16, right: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _addressTEController,
                    maxLines: 10,
                    decoration: InputDecoration(hintText: "Shipping Address"),
                    style: textStyle.base.copyWith(color: colors.heading),
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _cityTEController,
                    maxLines: 5,
                    decoration: InputDecoration(hintText: "City"),
                    style: textStyle.base.copyWith(color: colors.heading),
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _postalCodeTEController,
                    decoration: InputDecoration(hintText: "Postal Code"),
                    style: textStyle.base.copyWith(color: colors.heading),
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _phoneNumberTEController,
                    decoration: InputDecoration(hintText: "Phone Number"),
                    style: textStyle.base.copyWith(color: colors.heading),
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 16),
                  GetBuilder<OrderController>(
                    builder: (orderContext) => Button(
                      title: "Place Order",
                      onTap: _onTapPlaceOrder,
                      loading: orderContext.placeOrderLoading,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapPlaceOrder() {
    if (_formKey.currentState!.validate()) {
      _handlePlaceOrder();
    }
  }

  Future<void> _handlePlaceOrder() async {
    final String address = _addressTEController.text;
    final String city = _cityTEController.text;
    final String postalCode = _postalCodeTEController.text;
    final String phoneNumber = _phoneNumberTEController.text;

    final result = await _orderController.placeOrder(
      address: address,
      city: city,
      postalCode: postalCode,
      phoneNumber: phoneNumber,
    );
    if (!mounted) {
      return;
    }
    if (result) {
      AppBottomSheet.show(
        context: context,
        initialChildSize: 0.4,
        isDismissible: false,
        enableDrag: false,
        child: PlaceOrderModal(
          price: widget.price,
          transactionId: RandomUuid.generate(),
        ),
      );
    } else {
      ToastUtil.show(message: "Failed to place order", context: context);
    }
  }
}
