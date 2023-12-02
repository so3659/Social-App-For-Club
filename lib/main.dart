import 'package:flutter/material.dart';
import 'package:tongtong/db/mySqlConnector.dart';
import 'package:tongtong/login.dart';

void main() {
  dbConnector();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}
