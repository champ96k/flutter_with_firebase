import 'package:fluter_firebase/Authentication/Services/Auth.dart';
import 'package:flutter/material.dart';

class SignInHome extends StatelessWidget {

  SignInHome({@required this.onSignOut,@required this.auth});
  final VoidCallback onSignOut;

  final AuthBase auth;

  //_signOut
  Future<void> _signOut() async {
    try {
      await auth.signout();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        title: Text("Home Page"),
        actions: [
          FlatButton(
            onPressed: () {
              _signOut();
            }, 
            child: Text("Logout",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            ),
          )
        ],
      ),

      
    );
  }
}