import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/features/profile/ui/widgets/profile_action_card.dart';
import 'package:e_buy/features/profile/ui/widgets/profile_card.dart';
import 'package:e_buy/features/profile/ui/widgets/setting_accordion.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const name = "profile";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;
    final colors = context.colors;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  "My Profile",
                  style: textStyle.xl.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colors.heading,
                  ),
                ),
                const SizedBox(height: 16),
                ProfileCard(name: "Phillip Hans", email: "o8s7w@example.com"),
                const SizedBox(height: 16),

                const ProfileActionCard(title: "Order List"),

                const SizedBox(height: 16),
                const SettingAccordion(),
                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.error,
                  ),
                  child: const Text("Logout"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
