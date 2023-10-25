import 'package:flutter/material.dart';
import 'widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  bool _passwordVisible;

  LoginScreen({
    required this.emailController,
    required this.passwordController,
    this._passwordVisible = true,
  });

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    widget._passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 28),
            Text(
              'Holbegram',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 50),
            ),
            Image(
              width: 80,
              height: 60,
              image: AssetImage('assets/images/insta_text_logo.png'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 28),
                  TextFieldInput(
                    controller: widget.emailController,
                    isPassword: false,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 24),
                  TextFieldInput(
                    controller: widget.passwordController,
                    isPassword: !widget._passwordVisible,
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      alignment: Alignment.bottomLeft,
                      onPressed: () {
                        setState(() {
                          widget._passwordVisible = !widget._passwordVisible;
                        });
                      },
                      icon: Icon(widget._passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 28),
            SizedBox(
              height: 48,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(218, 226, 37, 24),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Log in',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Forgot your login details?'),
                Text(
                  'Get help logging in',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Flexible(
              flex: 0,
              child: Container(),
            ),
            SizedBox(height: 24),
            Divider(thickness: 2),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(218, 226, 37, 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Flexible(
                  child: Divider(thickness: 2),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('OR'),
                ),
                Flexible(
                  child: Divider(thickness: 2),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'your_image_link',
                  width: 40,
                  height: 40,
                ),
                Text('Sign in with Google'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
