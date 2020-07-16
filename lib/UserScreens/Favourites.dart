import 'package:flutter/material.dart';

class MyFavourites extends StatefulWidget {
  @override
  _MyFavouritesState createState() => _MyFavouritesState();
}

class _MyFavouritesState extends State<MyFavourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourites'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'My Favourites',
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}
