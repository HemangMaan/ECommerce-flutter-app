import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:GroceryCart/Tools/database.dart';
import 'package:provider/provider.dart';
import 'package:GroceryCart/UserScreens/OrderList.dart';
import 'package:GroceryCart/Tools/Orders.dart';

class MyOrderHistory extends StatefulWidget {
  @override
  _MyOrderHistoryState createState() => _MyOrderHistoryState();
}

class _MyOrderHistoryState extends State<MyOrderHistory> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Orders>>.value(
      value: DatabaseService().prodCollection,
      // return StreamProvider<QuerySnapshot>.value(
      //   value: DatabaseService().prodCollection.snapshots(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order History'),
          centerTitle: true,
        ),
        body: OrderList(),
      ),
    );
  }
}
