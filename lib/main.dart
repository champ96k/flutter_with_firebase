import 'package:fluter_firebase/Authentication/AuthHome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); 
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter With Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthHome(),
    );
  }
}
 