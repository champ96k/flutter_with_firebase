import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluter_firebase/Chat/Login.dart';
import 'package:fluter_firebase/Chat/Widget/MessageStream.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  final messageTextController = TextEditingController();

  FirebaseUser logInUser;
  String messageText = "";

  getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        logInUser = user;
        print(logInUser.email);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  _logout() async {
    await _auth.signOut();
    Navigator.pushNamed(context, LoginScreen.id);
  }

  _addData() async {
    try {
      await _firestore.collection('messages').add({
        'text': messageText,
        'sender': logInUser.email,
      });
    } catch (e) {
      print("Error Occure in _addData() Method");
      print(e.toString());
    }
  }

  // get messages with dealy
  // getMessages() async {
  //   final messages = await _firestore.collection("messages").getDocuments();
  //   for(var message in messages.documents) {
  //     print(message.data);
  //   }
  // }

  //get messgae with Stream
  getMessages() async {
    await for (var snapshot in _firestore.collection("messages").snapshots()) {
      for (var message in snapshot.documents) {
        print(message.data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          automaticallyImplyLeading: false,
          title: Text("Chat Screen"),
          actions: [
            FlatButton(
              onPressed: () {
                _logout();
              },
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
            MessageStream(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type Something here..."),
                        onChanged: (value) {
                          messageText = value;
                        },
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        messageTextController.clear();
                        _addData();
                        // getMessages();
                      },
                      child: Text("Send"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
