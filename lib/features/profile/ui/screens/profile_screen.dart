import 'package:e_buy/app/actions/auth_actions.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/auth/ui/controllers/auth_controller.dart';
import 'package:e_buy/features/profile/ui/widgets/profile_action_card.dart';
import 'package:e_buy/features/profile/ui/widgets/profile_card.dart';
import 'package:e_buy/features/profile/ui/widgets/setting_accordion.dart';
import 'package:e_buy/utils/data_type.dart';
import 'package:e_buy/utils/get_full_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                GetBuilder<AuthController>(
                  builder: (authContext) {
                    final userData = authContext.getUserProfile;

                    return ProfileCard(
                      name: getFullName(
                        userData?.firstName,
                        userData?.lastName,
                      ),
                      email: DataType.string(userData?.email),
                      image: userData?.avatarUrl,
                    );
                  },
                ),
                const SizedBox(height: 16),

                const ProfileActionCard(title: "Order List"),

                const SizedBox(height: 16),
                const SettingAccordion(),
                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    _logout(context);
                  },
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

  void _logout(BuildContext context) {
    AuthActions.logout();
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.main,
      (route) => false,
    );
  }
}
