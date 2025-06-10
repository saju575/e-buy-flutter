import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class MainLayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainLayoutAppBar({super.key, this.onTapLeading, required this.title});
  final VoidCallback? onTapLeading;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leading: IconButton(
        icon: AppIcon(icon: Icons.arrow_back),
        onPressed: onTapLeading,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
