import 'package:e_buy/app/colors/app_colors.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/auth/ui/widgets/auth_header.dart';
import 'package:e_buy/features/auth/ui/widgets/input_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const name = '/register';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _addressTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _addressTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: colors.body,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 80,
                bottom: 20,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthHeader(
                      title: "Register Account",
                      subtitle: "Please enter your details to sign up",
                    ),

                    const SizedBox(height: 24),

                    InputTitle(title: "First Name"),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _firstNameTEController,
                      style: textStyle.base.copyWith(color: colors.heading),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Alice"),
                    ),
                    const SizedBox(height: 20),
                    InputTitle(title: "Last Name"),

                    const SizedBox(height: 8),

                    TextFormField(
                      controller: _lastNameTEController,
                      style: textStyle.base.copyWith(color: colors.heading),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Smith"),
                    ),
                    const SizedBox(height: 20),
                    InputTitle(title: "Mobile Number"),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _mobileTEController,
                      style: textStyle.base.copyWith(color: colors.heading),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "+91 1234567890"),
                    ),
                    const SizedBox(height: 20),

                    InputTitle(title: "Email"),

                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _emailTEController,
                      style: textStyle.base.copyWith(color: colors.heading),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "yourmail@gmail.com",
                      ),
                    ),
                    const SizedBox(height: 20),

                    InputTitle(title: "Password"),

                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordTEController,
                      style: textStyle.base.copyWith(color: colors.heading),
                      textInputAction: TextInputAction.done,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "8 characters and more",
                      ),
                      obscureText: true,
                    ),

                    const SizedBox(height: 20),

                    InputTitle(title: "City"),

                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _cityTEController,
                      style: textStyle.base.copyWith(color: colors.heading),
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Johannesburg"),
                    ),
                    const SizedBox(height: 20),
                    InputTitle(title: "Address"),

                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _addressTEController,
                      style: textStyle.base.copyWith(color: colors.heading),
                      maxLines: 3,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(hintText: "Johannesburg"),
                    ),

                    const SizedBox(height: 28),
                    ElevatedButton(
                      onPressed: _onTapSignUp,
                      child: const Text("Sign Up"),
                    ),
                    const SizedBox(height: 28),
                    _renderLoginText(context, colors),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderLoginText(BuildContext context, AppColors colors) {
    final textStyle = context.textStyle;
    return Center(
      child: Text.rich(
        TextSpan(
          text: "Have an Account? ",
          style: textStyle.base.copyWith(color: colors.grey),
          children: [
            TextSpan(
              text: "Login",
              style: TextStyle(
                color: colors.primary, // Link color
                // Optional underline
              ),
              recognizer: TapGestureRecognizer()..onTap = _onTapLogin,
            ),
          ],
        ),
      ),
    );
  }

  void _onTapLogin() {
    Navigator.pop(context);
  }

  void _onTapSignUp() {
    if (_formKey.currentState!.validate()) {
      // TODO:: Need to do other things
      _moveToOtpVerifyScreen();
    }
  }

  void _moveToOtpVerifyScreen() {
    Navigator.pushNamed(context, AppRoutes.otpVerify);
  }
}
