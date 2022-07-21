import 'package:flutter/material.dart';
import 'package:project1/Screens/LoginPage.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}
