import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/assets/asset_paths.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/home/ui/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppIcon(iconName: AssetPaths.appLogoSvg, size: 30),
        actions: [
          AppBarIcon(iconName: AppIcons.bell, onTap: () {}),
          // AppBarIcon(iconData: Icons.call, onTap: () {}),
          AppBarIcon(iconName: AppIcons.user, onTap: () {}),
        ],
      ),
    );
  }
}
