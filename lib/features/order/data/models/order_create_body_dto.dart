import 'package:e_buy/features/order/domain/models/order_create_body_model.dart';

class OrderCreateBodyDto {
  final String paymentMethod;
  final OrderShippingAddressDto shippingAddress;

  OrderCreateBodyDto({
    required this.paymentMethod,
    required this.shippingAddress,
  });

  factory OrderCreateBodyDto.fromDomain(OrderCreateBodyModel model) {
    return OrderCreateBodyDto(
      paymentMethod: model.paymentMethod,
      shippingAddress: OrderShippingAddressDto.fromDomain(
        model.shippingAddress,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "payment_method": paymentMethod,
      "shipping_address": shippingAddress.toJson(),
    };
  }
}

class OrderShippingAddressDto {
  final String fullName;
  final String address;
  final String city;
  final int postalCode;
  final String phoneNumber;

  OrderShippingAddressDto({
    required this.fullName,
    required this.address,
    required this.city,
    required this.postalCode,
    required this.phoneNumber,
  });

  factory OrderShippingAddressDto.fromDomain(OrderShippingAddress address) {
    return OrderShippingAddressDto(
      fullName: address.fullName,
      address: address.address,
      city: address.city,
      postalCode: address.postalCode,
      phoneNumber: address.phoneNumber,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "full_name": fullName,
      "address": address,
      "city": city,
      "postal_code": postalCode,
      "phone": phoneNumber,
    };
  }
}
