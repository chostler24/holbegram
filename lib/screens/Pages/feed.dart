import 'package:flutter/material.dart';
import 'package:holbegram/screens/Pages/posts.dart';

class Feed extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    'Holbegram',
                    style: TextStyle(
                        fontFamily: 'Billabong',
                        fontSize: 35.0,
                    ),
                ),
                centerTitle: true,
                leading: Image.asset(
                    'assets/images/logo.png',
                    height: 40.0,
                ),
                actions: [
                    IconButton(
                        icon: Icon(Icons.camera_alt_outlined),
                        onPressed: () {},
                    ),
                    IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {},
                    ),
                ],
            ),
            body: Posts(),
        );
    }
}
