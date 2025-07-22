import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';

class SSLCommerzPaymentService {
  static final String _storeId = "easyb687fb456a9b51";
  static final String _storePassword = "easyb687fb456a9b51@ssl";
  static final String _mode = SSLCSdkType.TESTBOX;

  /// Start payment
  static Future<SSLCTransactionInfoModel?> pay({
    required double amount,
    String? currency,
    required String tranId,
    required String productCategory,
    String? customerName,
    String? customerPhone,
    String? customerEmail,
    String? customerAddress,
    required Function(SSLCTransactionInfoModel) onSuccess,
    required Function(String) onFailed,
    required Function(String) onCancelled,
  }) async {
    try {
      SSLCommerzInitialization
      sslCommerzInitialization = SSLCommerzInitialization(
        // ipn_url: "https://www.your_website.com/ipn", // Optional IPN URL
        multi_card_name:
            "mastercard,visacard,bkash,nagad", // Optional multiple card support
        currency: currency ?? SSLCurrencyType.BDT,
        product_category: productCategory,
        sdkType: _mode,
        store_id: _storeId,
        store_passwd: _storePassword,
        total_amount: amount,
        tran_id: tranId,
      );

      Sslcommerz sslcommerz = Sslcommerz(initializer: sslCommerzInitialization);
      final result = await sslcommerz.payNow();

      // Handle response
      if (result.status == "VALID") {
        onSuccess(result);
        return result;
      } else if (result.status == "FAILED") {
        print(result.currencyAmount);
        onFailed("Payment Failed");
      } else if (result.status!.toLowerCase() == "cancelled") {
        onCancelled("Payment Cancelled");
      }
    } catch (e) {
      onFailed("Error: ${e.toString()}");
    }
    return null;
  }
}
