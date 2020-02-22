import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whatsurulam/home.page.dart';

import 'auth.service.dart';
import 'main.dart';
import 'package:flutter/painting.dart';
import 'SignUp.dart';
import 'LogIn.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class LogIn extends StatefulWidget {

  @override
  _LogInState createState() => new _LogInState();
}

class _LogInState extends State<LogIn> {
  String _status = 'no-action';
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget build01(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
      ),
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/logo280.jpg"),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("What's your Ulam Pare?"),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign up'),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/signUp');
              }),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 25.0, right: 25.0),
                      child: Center(
                          child: Image(
                              image: AssetImage(
                                  "images/logo280.png") //image location and name
                              )),
                    ), //remove comment for image
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 25.0, right: 25.0),
                      child: Center(
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email';
                            } else
                              return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Center(
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 8.0, right: 8.0),
                          child: Container(
                            height: 50,
                            width: 180.0,
                            child: RaisedButton(
                              onPressed: () {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState.validate()) {
                                  // Process data.
                                }
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 8.0, right: 8.0),
                          child: Container(
                            height: 50,
                            width: 180.0,
                            child: RaisedButton(
                              onPressed: () {
                                signInWithGoogle().whenComplete(() {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return HomePage();
                                      },
                                    ),
                                  );
                                });
                              },
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image(
                                        image: AssetImage(
                                            "images/google_logo.png"),
                                        height: 20.0),
                                  ),
                                  Text(
                                    'Log in with Google',
                                    style: TextStyle(fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
