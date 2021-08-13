import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    final prodCollection = Provider.of<QuerySnapshot>(context);
    //print(prodCollection.documents);
    for (var doc in prodCollection.documents) {
      print(doc.documentID);
    }
    return Scaffold();
  }
}
