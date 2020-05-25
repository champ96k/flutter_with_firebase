import 'package:fluter_firebase/Model/AuthMethod.dart';
import 'package:flutter/material.dart';

class AuthHome extends StatefulWidget {
  @override
  _AuthHomeState createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  bool isPresed = false;

  AuthMethod _authMethod = AuthMethod();

  checkOption(var text) {
    switch (text) {
      case "Sign In With Google":
        _authMethod.signInWithGoogle();

        break;
      case "Sign In With Facebbok":
        _authMethod.signInWithFacebook();

        break;
      case "Sign In With Mobile No":
        _authMethod.signInWithPhone();

        break;
      case "Sign In With Email":
        _authMethod.signInWithEmail();

        break;
      case "Anonymous User":
        _authMethod.signInWithAnonymous(context);

        break;
      default:
    }
  }

  Widget signInButton(var text, var img, var color) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .74,
      height: size.height * 0.065,
      child: MaterialButton(
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          onPressed: () {
            setState(() {
              isPresed = true;
              checkOption(text);
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              img == null
                  ? Text("")
                  : Image(
                      height: size.height * 0.05,
                      image: NetworkImage(img),
                    ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ),
              )
            ],
          )
        ),
    );
  }

  @override
  void initState() {
    _authMethod.getCurrentUser(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Authentication"),
              automaticallyImplyLeading: false,
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: Center(
              child: isPresed
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        signInButton(
                            "Sign In With Google",
                            "https://www.makeitactive.com/images/2018/02/28/google.png",
                            Colors.brown),
                        signInButton(
                            "Sign In With Facebbok",
                            "https://www.freepngimg.com/thumb/facebook/24683-2-facebook-logo-photos.png",
                            Colors.blue),
                        signInButton(
                            "Sign In With Mobile No",
                            "https://www.freepngimg.com/thumb/symbol/59066-icons-hotel-astro-computer-suite-gmail.png",
                            Colors.red),
                        signInButton(
                            "Sign In With Email",
                            "https://www.freepngimg.com/thumb/gmail/60072-blue-triangle-area-symbol-aqua-mail.png",
                            Colors.teal),
                        signInButton("Anonymous User", null, Colors.orange),
                        Container(
                          child: Text("© Tushar Nikam"),
                        )
                      ],
                    ),
            )));
  }
}
