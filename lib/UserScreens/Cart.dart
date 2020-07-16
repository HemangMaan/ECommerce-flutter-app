import 'package:flutter/material.dart';

class MyAppCart extends StatefulWidget {
  @override
  _MyAppCartState createState() => _MyAppCartState();
}

class _MyAppCartState extends State<MyAppCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
