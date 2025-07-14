import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/product/domain/models/product_params_model.dart';

class ProductParamsDto extends UrlBuilderBaseModel {
  final String productId;
  ProductParamsDto({required this.productId});
  @override
  Map<String, dynamic> toJson() {
    return {"product_id": productId};
  }

  factory ProductParamsDto.fromDomain(ProductParamsModel params) {
    return ProductParamsDto(productId: params.productId);
  }
}
