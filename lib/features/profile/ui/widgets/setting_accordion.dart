import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/features/settings/ui/controllers/theme_controller.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/profile/ui/widgets/profile_action_card.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class SettingAccordion extends StatelessWidget {
  const SettingAccordion({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;
    final colors = context.colors;
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(
        "Settings",
        style: textStyle.base.copyWith(color: colors.heading),
      ),
      leading: AppIcon(iconName: AppIcons.setting, color: colors.heading),
      trailing: AppIcon(iconName: AppIcons.arrowDown, color: colors.grey),
      backgroundColor: colors.body,
      tilePadding: EdgeInsets.only(left: 12, right: 8, top: 6, bottom: 6),
      childrenPadding: EdgeInsets.only(top: 12),
      minTileHeight: 24,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileActionCard(
              onTap: () {},
              iconName: AppIcons.language,
              title: "Language",
            ),
            const SizedBox(height: 6),
            GetBuilder<ThemeController>(
              builder: (themeContext) {
                return ProfileActionCard(
                  onTap: () {
                    _moveToThemeChangeScreen(context);
                  },
                  iconName: AppIcons.sun,
                  title: "${themeContext.selectedTheme.title} Mode",
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  void _moveToThemeChangeScreen(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.themeChange);
  }
}
