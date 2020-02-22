import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  _LoginFormState createState() => new _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Log in"),
      ),
      body: Center(
        child: Column(
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
                          decoration: const InputDecoration(
                            hintText: 'Enter your First Name',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your First Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 25.0, right: 25.0),
                      child: Center(
                        child: TextFormField(
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
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 25.0, right: 25.0),
                      child: Center(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your First Name',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your First Name';
                            }
                            return null;
                          },
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
                              // Process data.
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
}
