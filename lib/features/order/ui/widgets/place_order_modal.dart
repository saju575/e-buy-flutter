import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/button.dart';
import 'package:e_buy/core/services/payment/ssl_commerz_payment_service.dart';
import 'package:e_buy/features/shared/ui/controllers/actions/jump_action.dart';
import 'package:e_buy/utils/toast_util.dart';
import 'package:flutter/material.dart';

class PlaceOrderModal extends StatelessWidget {
  final double price;
  final String transactionId;
  const PlaceOrderModal({
    super.key,
    required this.price,
    required this.transactionId,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              "You have Successfully placed order.",
              style: textStyle.lg.copyWith(
                color: colors.heading,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              "To complete your order, please complete the payment",
              style: textStyle.base.copyWith(
                color: colors.bodyText,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button(
                  width: screenWidth * 0.45,
                  title: "Pay",
                  onTap: () async {
                    await SSLCommerzPaymentService.pay(
                      amount: price,
                      tranId: transactionId,
                      productCategory: "food",
                      onSuccess: (transactionInfo) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        moveToHomeScreen();
                        ToastUtil.show(
                          message: "Payment successful",
                          context: context,
                        );
                      },
                      onFailed: (error) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        moveToHomeScreen();
                        ToastUtil.show(
                          message: "Payment failed",
                          context: context,
                        );
                      },
                      onCancelled: (error) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        moveToHomeScreen();
                      },
                    );
                  },
                ),
                Button(
                  width: screenWidth * 0.45,
                  title: "Cancel",
                  color: colors.error,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
