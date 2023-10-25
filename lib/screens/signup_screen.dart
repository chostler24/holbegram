import 'package:flutter/material.dart';
import 'widgets/text_field.dart';

class SignUp extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;
  bool _passwordVisible;

  SignUp({
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.passwordConfirmController,
    this._passwordVisible = true,
  });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    widget._passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    // Implement your UI here
    return Container();
  }
}
