import 'package:fluter_firebase/Chat/Widget/RoundedButton.dart';
import 'package:fluter_firebase/Model/Style.dart';
import 'package:flutter/material.dart';
import 'package:fluter_firebase/Chat/Login.dart';
import 'package:fluter_firebase/Chat/RegistrationScreen.dart';

class ChatHome extends StatefulWidget {
  static String id = 'chatHome';
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(
        seconds: 1, 
      ),
      vsync: this,
      lowerBound: 0.4
    );
    animation = CurvedAnimation(
      parent: controller, 
      curve: Curves.bounceIn
    );
    controller.forward();
    controller.addListener(() {
      setState(() {
       // print(controller.value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(controller.value),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  Hero(
                    tag: "logo",
                    child: Image(
                      height: 48.0,
                      image: AssetImage("images/chat.jpg"),
                    ),
                  ),
                  Text(
                    "Flash Chat",
                    style: ThemeText.chatTitle,
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              
              RoundedButton(
                title:"Login",
                onPressed : (){
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                color :  Colors.teal[700],  
              ),

              SizedBox(
                height: 8.0, 
              ),

               RoundedButton(
                title:"Register",
                onPressed : (){
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                color :  Colors.blueAccent[700],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
