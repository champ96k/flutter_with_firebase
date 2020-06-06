import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluter_firebase/Chat/ChatScreen.dart';
import 'package:fluter_firebase/Chat/Widget/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:fluter_firebase/Chat/Widget/CustomTextField.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  String email, password;
  bool isLoading = false;

  _emailLogin() async {
   try {
      try {
      final user = _auth.signInWithEmailAndPassword(email: email, password: password);
    if (user != null) {
     setState(() {
        isLoading =false;
      Navigator.pushNamed(context, ChatScreen.id);
     });
    }
    } catch (e) {
      print(e.toString());
    }
   } catch (e) {
     print(e.toString());
   }
  }
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: isLoading==true ? Center(
            child: CircularProgressIndicator(),
          ) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Hero(
              tag: "logo",
              child: Image(
                height: 180.0,
                image: AssetImage("images/chat.jpg"),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              hintText: "Enter Email",
              inputType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              hintText: "Enter Password",
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            RoundedButton(
              title: "Login",
              onPressed: () {
                setState(() {
                  isLoading = true;
                   _emailLogin();
                });
              },
              color: Colors.teal,
            ),
          ],
        ),
      )),
    );
  }
}

