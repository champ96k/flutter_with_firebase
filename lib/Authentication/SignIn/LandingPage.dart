import 'package:fluter_firebase/Authentication/Services/Auth.dart';
import 'package:fluter_firebase/Authentication/SignIn/SignInPage.dart';
import 'package:fluter_firebase/Authentication/SignInHome.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LandingPage extends StatefulWidget {

  LandingPage({@required this.auth}); 
  final AuthBase auth;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  
  User _user;

   @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

   Future<void> _checkCurrentUser() async {
   User user = await widget.auth.currentUser();
    _updateUser(user);
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

 
  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        onSignIn: _updateUser,
      ); 
    }
    return SignInHome(
      auth: widget.auth,
      onSignOut: () => _updateUser(null),
    );
  }
}
