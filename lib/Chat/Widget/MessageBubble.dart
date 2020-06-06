import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {

  MessageBubble({this.sender,this.text});
  final String sender;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0), 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Text("$sender"),

          Material(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),  
              child: Text("$text",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
