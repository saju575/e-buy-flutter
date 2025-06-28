import 'package:e_buy/features/settings/domain/models/theme_value.dart';
import 'package:e_buy/features/settings/ui/controllers/theme_controller.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ThemeChangeScreen extends StatefulWidget {
  const ThemeChangeScreen({super.key});
  static const name = "theme-change-screen";
  @override
  State<ThemeChangeScreen> createState() => _ThemeChangeScreenState();
}

class _ThemeChangeScreenState extends State<ThemeChangeScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Scaffold(
      appBar: AppBar(title: const Text("Change Theme")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  "Change App Theme",
                  style: textStyle.lg.copyWith(
                    color: colors.heading,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),

                GetBuilder<ThemeController>(
                  builder: (themeController) {
                    // print("Current theme ${themeController.themeMode}");
                    // print("Selected theme ${themeController.selectedTheme}");
                    return Column(
                      children: [
                        for (var theme in themeController.themeList)
                          // print("Theme ${theme}");
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: RadioListTile<ThemeValue>(
                              value: theme,
                              contentPadding: EdgeInsets.zero,
                              groupValue: themeController.selectedTheme,
                              title: Text(
                                theme.title,
                                style: textStyle.base.copyWith(
                                  color: colors.heading,
                                ),
                              ),
                              onChanged: (value) async {
                                if (value != null) {
                                  await themeController.updateTheme(value);
                                }
                              },
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
