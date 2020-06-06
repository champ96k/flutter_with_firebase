import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluter_firebase/Chat/ChatScreen.dart';
import 'package:fluter_firebase/Chat/Widget/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:fluter_firebase/Chat/Widget/CustomTextField.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email, password;
  FirebaseAuth _auth = FirebaseAuth.instance;

  registerEmail() async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (user != null) {
      Navigator.pushNamed(context, ChatScreen.id);
    }
    } catch (e) {
      print("Error Occure");
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
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
              onChanged: (input) => email = input,
            ),
            SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              hintText: "Enter Password",
              obscureText: true,
              onChanged: (input) => password = input,
            ),
            SizedBox(
              height: 16.0,
            ),
            RoundedButton(
              title: "Register",
              onPressed: () {
                registerEmail();
              },
              color: Colors.teal,
            ),
          ],
        ),
      )
     ),
    );
  }
}
