import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluter_firebase/Model/AuthMethod.dart';
import 'package:fluter_firebase/Model/Style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final user;
  final String text;
  HomeScreen(this.user, this.text);
  @override
  _HomeScreenState createState() => _HomeScreenState(this.user,this.text);
}

class _HomeScreenState extends State<HomeScreen> {
  AuthResult user; 
  String text;
  _HomeScreenState(this.user,this.text);

  @override
  void initState() {
    super.initState();
    checkUserTye();
  }

  var displayTitle;

  checkUserTye() {
    switch (text) {
      case "Anonymous": 
        displayTitle = user.user.uid; 
        break;
      case "Google": 
        displayTitle = user.user.uid; 
        break;
      default:
    }
  }

  AuthMethod _authMethod = AuthMethod();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: ThemeText.titleText,
              ),
              SizedBox(
                height: 50, 
              ),
              displayTitle==null ? Text("Null"):Text("$displayTitle",
                style: ThemeText.userText,
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  _authMethod.signout(context);
                },
                child: Text("Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
