import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluter_firebase/Authentication/AuthHome.dart';
import 'package:fluter_firebase/Authentication/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethod {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseUser _user;

  Future getCurrentUser(BuildContext context) async {
    try {
      _user = await FirebaseAuth.instance.currentUser();
      print("Current User : ${_user.uid}");
      if (_user != null) {
        print("User not Null");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomeScreen(_user, "")));
      } else {
        print("User is Null");
      }
    } catch (e) {
      print(e.toString());
    }
    return _user;
  }

  //Google Sign in
  Future<void> signInWithGoogle() async {
    try {
      final authResult = await _googleSignIn.signIn();
      print(authResult.displayName);
      print(authResult.email);
    } catch (error) {
      print("error occure");
      print(error); 
    }
  }
 
  //Facebook Sign in
  signInWithFacebook() {
    print("signInWithFacebook Button Press");
  }

  //Phone Sign in
  signInWithPhone() {
    print("signInWithPhone Button Press");
  }

  //Anonymous Sign in
  Future<void> signInWithAnonymous(BuildContext context) async {
    print("Inside Anonymous Method");
    try {
      final authResult = await FirebaseAuth.instance.signInAnonymously();
      print("${authResult.user.uid}");
      if (authResult.user.uid != null) {
        print("sent to next screen");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(authResult, "Anonymous")));
      } else {
        print("User is not login");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //signInWithEmail Sign in
  signInWithEmail() {
    print("signInWithEmail Button Press");
  }

  //Sign out Sign in
  signout(BuildContext context) async {
    print("signout Button Press");
    await FirebaseAuth.instance.signOut();
    print("$_user");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AuthHome()));
  }
}
