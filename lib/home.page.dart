import 'main.dart';
import 'home.page.dart';
import 'auth.service.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('What\'s your Ulam Pare? (HOME)'),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout'),
              textColor: Colors.white,
              onPressed: () {
                appAuth.logout().then((_) =>
                    Navigator.of(context).pushReplacementNamed('/login'));
              })
        ],
      ),
      body: new Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            child: new Column(
              children: <Widget>[
                new Image(
                    image: AssetImage(
                        "images/google_logo.png") //image location and name
                    ),
                new Text('Welcome to App!'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
