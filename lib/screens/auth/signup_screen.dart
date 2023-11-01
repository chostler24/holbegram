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
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            const SizedBox(height: 24),
            TextFieldInput(
              controller: widget.emailController,
              isPassword: false,
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            TextButton(
              onPressed: () {
              },
              child: Text(
                "Already have an account? Log in",
                style: TextStyle(
                  color: Color.fromARGB(218, 226, 37, 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
