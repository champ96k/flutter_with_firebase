import 'package:fluter_firebase/Authentication/Services/Auth.dart';
import 'package:fluter_firebase/Model/Style.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  
  //custom own callback
  SignInPage({@required this.auth, @required this.onSignIn});
  final Function(User) onSignIn;
  final AuthBase auth;

  //Anonymous Sign in
  Future<void> signInWithAnonymous() async {
    try {
      User user = await auth.signInAnonymous();
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Flutter Authentication"),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Sign In",
              style: ThemeText.signinTitle,
            ),

            SizedBox(
              height: 30,
            ),

            //Googgle SingIN Button
            Container(
              width: size.width * .90,
              height: size.height * 0.065,
              child: MaterialButton(
                  color: Colors.white,
                  onPressed: () {
                    print("Sign In With Goolge Button Press");
                  },
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        height: size.height * 0.05,
                        image: NetworkImage(
                            "https://www.makeitactive.com/images/2018/02/28/google.png"),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Sign In With Google",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  )),
            ),

            SizedBox(
              height: 10,
            ),

            //Facebook SingIN Button
            Container(
              width: size.width * .90,
              height: size.height * 0.065,
              child: MaterialButton(
                  color: Color(0xff3b5998),
                  onPressed: () {
                    print("Sign In With Facebook Button Press");
                  },
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        height: size.height * 0.05,
                        image: NetworkImage(
                            "https://www.freepngimg.com/thumb/facebook/24683-2-facebook-logo-photos.png"),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        "Sign In With Facebook",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  )),
            ),

            SizedBox(
              height: 10,
            ),

            //email SingIN Button
            Container(
              width: size.width * .90,
              height: size.height * 0.065,
              child: MaterialButton(
                  color: Colors.teal[700],
                  onPressed: () {
                    print("Sign In With Email Button Press");
                  },
                  child: Text(
                    "Sign In With Email",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
            ),

            SizedBox(
              height: 10,
            ),

            Text("Or"),

            SizedBox(
              height: 10,
            ),

            //Anonoymous SingIN Button
            Container(
              width: size.width * .90,
              height: size.height * 0.065,
              child: MaterialButton(
                  color: Colors.lime[300],
                  onPressed: () {
                    print("AnonymousButton Press");
                    signInWithAnonymous();
                  },
                  child: Text(
                    "Go Anonymous",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
