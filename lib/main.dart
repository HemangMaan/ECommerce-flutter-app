import 'package:flutter/material.dart';
import 'UserScreens/HomePage.dart';

void main() {
  return runApp(GroceryStoreApp());
}

class GroceryStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swadesh-E-Haat',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(),
    );
  }
}
