import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/homeButton.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void handleGenerator() {
      Navigator.pushNamed(context, '/password');
    }

    void handleSafe() {
      Navigator.pushNamed(context, '/safe');
    }

    void handleSettings() {
      Navigator.pushNamed(context, '/settings');
    }

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Welcome to PWORD",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21.0),
        ),
        Text("your password manager & generator"),
        Padding(
          padding: EdgeInsets.all(50.0),
          child: null,
        ),
        HomeButton("Generator", "blue", handleGenerator),
        HomeButton("Safe", "green", handleSafe),
        RaisedButton(
          onPressed: handleSettings,
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
