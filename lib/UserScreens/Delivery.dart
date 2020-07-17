import 'package:flutter/material.dart';

class MyDeliveryAddress extends StatefulWidget {
  @override
  _MyDeliveryAddressState createState() => _MyDeliveryAddressState();
}

class _MyDeliveryAddressState extends State<MyDeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'No Delivery',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
