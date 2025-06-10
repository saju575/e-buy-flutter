import 'package:e_buy/app/colors/app_colors.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/auth/ui/widgets/auth_header.dart';
import 'package:e_buy/features/auth/ui/widgets/input_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 80),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthHeader(
                    title: "Welcome Back",
                    subtitle: "Enter your Email to Sign in",
                  ),

                  const SizedBox(height: 24),
                  InputTitle(title: "Email"),

                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    style: textStyle.base.copyWith(color: colors.heading),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(hintText: "Enter Your Email"),
                  ),
                  const SizedBox(height: 20),
                  InputTitle(title: "Password"),

                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    style: textStyle.base.copyWith(color: colors.heading),
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: "8 characters and more",
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 28),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.main,
                        (_) => false,
                      );
                    },
                    child: const Text("Log in"),
                  ),
                  const SizedBox(height: 28),
                  _renderSignupText(context, colors),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderSignupText(BuildContext context, AppColors colors) {
    final textStyle = context.textStyle;
    return Center(
      child: Text.rich(
        TextSpan(
          text: "Don't Have an Account? ",
          style: textStyle.base.copyWith(color: colors.grey),
          children: [
            TextSpan(
              text: "Sign Up",
              style: TextStyle(
                color: colors.primary, // Link color
                // Optional underline
              ),
              recognizer: TapGestureRecognizer()..onTap = _onTapSignUp,
            ),
          ],
        ),
      ),
    );
  }

  void _onTapSignUp() {
    Navigator.pushNamed(context, AppRoutes.signUp);
  }
}
