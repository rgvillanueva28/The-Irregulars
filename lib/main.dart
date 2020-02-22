import 'home.page.dart';
import 'auth.service.dart';
import 'LogIn.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';

AuthService appAuth = new AuthService();

void main() async {
  // Set default home.
  Widget _defaultHome = new LogIn();

  // Get result of the login function.
  bool _result = await appAuth.login();
  if (_result) {
    _defaultHome = new HomePage();
  }

  // Run app!
  runApp(new MaterialApp(
    title: 'App',
    theme: ThemeData(
      primaryColor: Colors.red,
      primarySwatch: Colors.red,
      brightness: Brightness.dark,
    ),
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/home': (BuildContext context) => new HomePage(),
      '/login': (BuildContext context) => new LogIn(),
      '/signUp': (BuildContext context) => new SignUp()
    },
  ));
}