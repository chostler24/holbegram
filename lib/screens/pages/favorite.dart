import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget { // This is the Favorites Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Center(
        child: Text(
          'Favorite Page Content',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
