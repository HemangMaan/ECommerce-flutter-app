import 'package:flutter/material.dart';

class AppMessages extends StatefulWidget {
  @override
  _AppMessagesState createState() => _AppMessagesState();
}

class _AppMessagesState extends State<AppMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Messages'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Messages',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
