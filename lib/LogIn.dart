import 'auth.service.dart';
import 'main.dart';
import 'package:flutter/painting.dart';
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
  State<StatefulWidget> createState() => new _LogInState();
}

class _LogInState extends State<LogIn> {
  String _status = 'no-action';
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  Widget build01(BuildContext context){
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
          image: AssetImage("images/loginbg.jpg"),
        ),
      ),
    ),

    );
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
      appBar: new AppBar(

        title: new Text('Login'),
        backgroundColor: Colors.orange,
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
                              left: 25.0, right: 25.0, top: 15),
                          child: Center(
                            child: new Container(
                                width: 200.0,
                                height: 200.0,
                                alignment: Alignment.center,
                                decoration: new BoxDecoration(
                                  image :DecorationImage(
                                    image: AssetImage('assets/logo.png'),
                                    fit: BoxFit.fill
                                ),
                            )
                          )
                          )

                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 30.0),
                          child: Center(
                            child: Text(
                              "What\'s your ulam?",
                              style: new TextStyle(
                                fontSize: 24.0,
                                color:  Colors.black,
                              ),
                            ),
                          )
                              ),
                            ]
                    )

                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0),
                          child: Center(
                            child: TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: 'Enter your email',
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your email.';
                                }else
                                  return null;
                              },

                            ),
                          ),
                        ),
                        Padding(

                          padding:const EdgeInsets.only(
                              left: 25.0, right: 25.0),
                          child:Center(
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                hintText: 'Enter your password.',
                              ),
                              validator: (value) {
                                if (value.isEmpty){
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                              obscureText: true,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:  16.0),
                            child: RaisedButton(
                              onPressed: (){
                                //setState(() => this._status = 'loading');

                                appAuth.login().then((result) {
                                  if (result) {
                                    Navigator.of(context).pushReplacementNamed('/home');
                                  } else {
                                    setState(() => this._status = 'rejected');
                                  }
                                });
                              },
                              child: Text('Log In'),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Container(
                                width: 180.0,
                                child:RaisedButton(
                                  onPressed: (){},
                                  child:Text('Log In with Facebook'),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Container(
                                  width: 180.0,
                                  child: RaisedButton(
                                    onPressed: (){},
                                    child: Text('Log In with Gmail'),
                                  ),
                                )
                            )
                          ],
                        )
                      ],
                    ),
                  )

              );
}