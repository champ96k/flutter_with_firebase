import 'package:flutter/material.dart';
import 'package:fluter_firebase/Chat/ChatHome.dart';
import 'package:fluter_firebase/Chat/Login.dart';
import 'package:fluter_firebase/Chat/RegistrationScreen.dart';
import 'package:fluter_firebase/Chat/ChatScreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ChatHome.id,
      routes: {
         ChatHome.id : (context) => ChatHome(),
         LoginScreen.id : (context) => LoginScreen(),
         RegistrationScreen.id: (context) => RegistrationScreen(), 
         ChatScreen.id : (context) => ChatScreen(),
      },
    );
  }
}