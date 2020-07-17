import 'package:flutter/material.dart';

class MyOrderHistory extends StatefulWidget {
  @override
  _MyOrderHistoryState createState() => _MyOrderHistoryState();
}

class _MyOrderHistoryState extends State<MyOrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'No History',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
