import 'package:flutter/material.dart';

import 'calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Calculator by MARIA',
              style: TextStyle(color: Colors.black87),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white70,
        ),
        body: Calculator(),
      ),
    );
  }
}
