import 'package:flutter/material.dart';
import 'package:holbegram/screens/bottom_nav.dart';

class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    @override
    Widget build(BuildContext context) {
        return BottomNav();
    }
}
