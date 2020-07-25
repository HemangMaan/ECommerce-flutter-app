import 'package:GroceryCart/Tools/authentication.dart';
import 'package:GroceryCart/UserScreens/root_page.dart';
import 'package:flutter/material.dart';
import 'UserScreens/root_page.dart';

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
      home: RootPage(
        auth: Auth(),
      ),
    );
  }
}
