class OrderCreateBodyModel {
  final String paymentMethod;
  final OrderShippingAddress shippingAddress;

  OrderCreateBodyModel({
    required this.paymentMethod,
    required this.shippingAddress,
  });

  OrderCreateBodyModel copyWith({
    String? paymentMethod,
    OrderShippingAddress? shippingAddress,
  }) {
    return OrderCreateBodyModel(
      paymentMethod: paymentMethod ?? this.paymentMethod,
      shippingAddress: shippingAddress ?? this.shippingAddress,
    );
  }
}

class OrderShippingAddress {
  final String fullName;
  final String address;
  final String city;
  final int postalCode;
  final String phoneNumber;

  OrderShippingAddress({
    required this.fullName,
    required this.address,
    required this.city,
    required this.postalCode,
    required this.phoneNumber,
  });

  // copyWith
  OrderShippingAddress copyWith({
    String? fullName,
    String? address,
    String? city,
    int? postalCode,
    String? phoneNumber,
  }) {
    return OrderShippingAddress(
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
