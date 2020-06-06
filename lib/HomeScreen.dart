import 'package:fluter_firebase/Authentication/Services/Auth.dart';
import 'package:fluter_firebase/Authentication/SignIn/LandingPage.dart';
import 'package:fluter_firebase/Chat/ChatHome.dart';
import 'package:fluter_firebase/Model/Style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            //Authentication Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), 
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.06,
                color: Colors.orange,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LandingPage(
                          auth: Auth(),
                        ),
                      ));
                },
                child: Text("Authentication",
                style: ThemeText.homeButton,
                ),
              ),
            ),


            //Chat Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.06,
                color: Colors.deepPurple,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatHome(),
                      ));
                },
                child: Text("Chat",
                style: ThemeText.homeButton,
                ), 
              ),
            ),


          ],
        ),
      ),
    );
  }
}
