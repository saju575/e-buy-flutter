import 'package:e_buy/features/shared/ui/controllers/actions/jump_action.dart';
import 'package:flutter/material.dart';

class ProfileScreens extends StatefulWidget {
  const ProfileScreens({super.key});

  @override
  State<ProfileScreens> createState() => _ProfileScreensState();
}

class _ProfileScreensState extends State<ProfileScreens> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        moveToHomeScreen();
      },
      child: Scaffold(
        body: SafeArea(child: SingleChildScrollView(child: Container())),
      ),
    );
  }
}
