import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    double initialChildSize = 0.5, // 50% of screen height
    double minChildSize = 0.25, // 25% of screen height
    double maxChildSize = 0.9, // 90% of screen height
    bool expand = false,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    ShapeBorder? shape,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // make edges rounded
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: expand,
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          builder: (context, scrollController) {
            return Container(
              decoration: ShapeDecoration(
                color: backgroundColor ?? context.colors.primaryWeak,
                shape:
                    shape ??
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // 👇 Grab Handle
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: context.colors.grey,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Expanded(child: child),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
