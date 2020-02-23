import 'cards_section_alignment.dart';
import 'cards_section_draggable.dart';
import 'main.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  bool showAlignmentCards = false;

  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(
      title: new Text('What\'s your ulam?'),
      backgroundColor: Colors.red,
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
    body:
    Column(
      children: <Widget>[
        showAlignmentCards
            ? CardsSectionAlignment(context)
            : CardsSectionDraggable(),
        buttonsRow()
      ],
    ),


  );

  Widget buttonsRow() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 48.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(Icons.loop, color: Colors.yellow),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(Icons.close, color: Colors.red),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(Icons.favorite, color: Colors.green),
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          FloatingActionButton(
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: Icon(Icons.star, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

