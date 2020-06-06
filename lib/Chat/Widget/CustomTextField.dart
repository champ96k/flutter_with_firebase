import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  CustomTextField({@required this.onChanged, @required this.hintText,this.inputType,this.obscureText});

  final Function onChanged;
  final String hintText;
  final TextInputType inputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      color: Colors.teal,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        margin: EdgeInsets.all(0.60),
        child: TextFormField(
          obscureText: obscureText == null ? false :obscureText ,
          onChanged: onChanged,
          keyboardType: inputType == null ? TextInputType.text :inputType ,
          textAlign: TextAlign.center,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: hintText),
        ),
      ),
    );
  }
}
