import 'package:fluter_firebase/Model/AuthMethod.dart';
import 'package:flutter/material.dart';

class AuthHome extends StatefulWidget {
  @override
  _AuthHomeState createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {

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
        _authMethod.signInWithAnonymous();
        break;
      default:
    }
  }

  Widget signInButton(var text, var img) {
    var size = MediaQuery.of(context).size;
    return MaterialButton(
        height: size.height * 0.06,
        minWidth: size.width * 0.80,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        onPressed: () {
          checkOption(text);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            img == null
                ? Container()
                : Image(
                    height: size.height * 0.05,
                    image: NetworkImage(img),
                  ),
            Text(text)
          ],
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Authentication"),
        ),
        body: Column(
          children: <Widget>[
            signInButton("Sign In With Google",
                "https://www.makeitactive.com/images/2018/02/28/google.png"),
            signInButton("Sign In With Facebbok",
                "https://www.freepngimg.com/thumb/facebook/24683-2-facebook-logo-photos.png"),
            signInButton("Sign In With Mobile No",
                "https://www.freepngimg.com/thumb/symbol/59066-icons-hotel-astro-computer-suite-gmail.png"),
            signInButton("Sign In With Email",
                "https://www.freepngimg.com/thumb/gmail/60072-blue-triangle-area-symbol-aqua-mail.png"),
            signInButton("Anonymous User", null),
          ],
        ),
      ),
    );
  }
}
