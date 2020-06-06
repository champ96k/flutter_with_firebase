import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluter_firebase/Chat/Widget/MessageBubble.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  final Firestore _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection("messages").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data.documents;
                  List<MessageBubble> messageBubbles = [];
                  for (var message in messages) {
                    final messageText = message.data['text'];
                    final messageSender = message.data['sender'];

                    final messageBubble = MessageBubble(
                      sender: messageSender,
                      text: messageText,
                    );
                    messageBubbles.add(messageBubble);
                  }
                  return Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      children: messageBubbles,
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
  }
} 