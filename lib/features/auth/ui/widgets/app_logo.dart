import 'package:e_buy/app/assets/asset_paths.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return AppIcon(iconName: AssetPaths.appLogoSvg, size: size ?? 80);
  }
}
