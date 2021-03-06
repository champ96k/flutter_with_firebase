import 'package:flutter/material.dart';

abstract class ThemeText {

  static const TextStyle titleText = TextStyle(
    fontSize: 27.0,   
    color: Colors.indigo,
    letterSpacing: 1.15,
  );

  static const TextStyle homeButton = TextStyle(
    fontSize: 16.0,  
    color: Colors.white, 
  );


  static const TextStyle signinTitle = TextStyle(
    fontSize: 27.0,  
    fontWeight: FontWeight.w700,
  );

  static const TextStyle chatHomeButton = TextStyle(
    color: Colors.white,
  );

  static const TextStyle chatTitle = TextStyle(
    color: Colors.black,
    fontSize: 36.0,
    fontWeight: FontWeight.w700,
  );
  

}