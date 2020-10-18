import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  Function handleClick() {
    print("oi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Welcome to PWORD"),
        Text("your password manager & generator"),
        Padding(
          padding: EdgeInsets.all(50.0),
          child: null,
        ),
        RaisedButton(
          onPressed: handleClick,
          child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('oi'), Text('oi')],
              ),
            ),
            width: 400.0,
            height: 200.0,
          ),
        ),
        RaisedButton(
          onPressed: null,
          child: Text("Safe"),
        ),
        RaisedButton(
          onPressed: null,
          child: Text("Settings"),
        ),
        Padding(
          padding: EdgeInsets.all(50.0),
          child: null,
        ),
        Text("v1.0 - 2020"),
        Text("NeakApps"),
      ],
    )));
  }
}

// class Test extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }
