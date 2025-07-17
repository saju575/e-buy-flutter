import 'package:e_buy/app/actions/auth_actions.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:flutter/material.dart';

void guardRoute({
  required BuildContext context,
  required VoidCallback onAllowed,
  String? fallbackRoute,
  Object? fallbackArguments,
}) {
  if (AuthActions.isLoggedIn) {
    onAllowed();
  } else {
    Navigator.pushNamed(
      context,
      fallbackRoute ?? AppRoutes.login,
      arguments: fallbackArguments,
    );
  }
}
