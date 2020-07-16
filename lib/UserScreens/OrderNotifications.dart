import 'package:flutter/material.dart';

class MyOrderNotifications extends StatefulWidget {
  @override
  _MyOrderNotificationsState createState() => _MyOrderNotificationsState();
}

class _MyOrderNotificationsState extends State<MyOrderNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Notifications'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'My Order Notifications',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
