import 'package:fluter_firebase/Model/Style.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  
  RoundedButton({this.title, this.color, @required this.onPressed});

  final String title;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      minWidth: size.width * 0.90,
      height: size.height * 0.06,
      color: color,
      onPressed: onPressed,
      child: Text(
        title,
        style: ThemeText.chatHomeButton,
      ),
    );
  }
}