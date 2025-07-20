import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/button.dart';
import 'package:e_buy/features/reviews/ui/controllers/review_controller.dart';
import 'package:e_buy/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.productId});
  static const name = "create-review-screen";
  final String productId;
  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _reviewTEController = TextEditingController();
  final ReviewController _reviewController = Get.find<ReviewController>();

  @override
  void dispose() {
    _reviewTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(title: const Text("Create Review"), centerTitle: true),
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
                    controller: _reviewTEController,
                    maxLines: 10,
                    decoration: InputDecoration(hintText: "Write Review"),
                    style: textStyle.base.copyWith(color: colors.heading),
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value!.isEmpty ? "Required" : null,
                  ),
                  const SizedBox(height: 18),

                  GetBuilder<ReviewController>(
                    builder: (reviewContext) {
                      return Button(
                        loading: reviewContext.reviewCreateLoading,
                        title: "Submit",
                        onTap: _submitReview,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitReview() {
    if (_formKey.currentState!.validate()) {
      handleSubmitReview();
    }
  }

  Future<void> handleSubmitReview() async {
    final message = _reviewTEController.text;
    final result = await _reviewController.createReview(
      productId: widget.productId,
      comment: message,
    );
    if (!mounted) {
      return;
    }
    if (result) {
      Navigator.pop(context);
      ToastUtil.show(message: "Review created successfully", context: context);
    } else {
      ToastUtil.show(
        message: _reviewController.reviewCreateErrorMessage ?? "",
        context: context,
      );
    }
  }
}
