import 'main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      title: new Text('What\'s your ulam?'),
      backgroundColor: Colors.orange,
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.person),
          label: Text('Signout'),
          onPressed: (){
            appAuth.logout().then(
                    (_) => Navigator.of(context).pushReplacementNamed('/login')
            );
          },
        )
      ],
    ),

    body: new Container(
      margin: new EdgeInsets.only(
          top: 50.0
      ),
      alignment: Alignment.center,
      child: new Column(
      ),
    ),
  );
}