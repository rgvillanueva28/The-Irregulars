import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _mnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sign Up"),
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
                        child: TextFormField(
                          controller: _fnameController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your First Name',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your First Name';
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
                          controller: _mnameController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your Middle Name',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Middle Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Center(
                        child: TextFormField(
                          controller: _lnameController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your Last Name',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Last Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Center(
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email';
                            }
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
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Center(
                        child: TextFormField(
                          controller: _password2Controller,
                          decoration: const InputDecoration(
                            hintText: 'Confirm your password',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please confirm your password';
                            }

                            return null;
                          },
                          obscureText: true,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: RaisedButton(
                          onPressed: () {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (_formKey.currentState.validate()) {
                              //                              // Process data.
                            }

                            if (passValidate()==true){
                              print("done");
                            } else{
                              print("passwords do not match");
                            }
                          },
                          child: Text('Submit'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool passValidate() {
    String password = _passwordController.text;
    String password2 = _password2Controller.text;
    if (password == password2) {
      return true;
    } else {
      return false;
    }
  }
}
