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
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      "Welcome to PWORD",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 21.0,
                      ),
                    ),
                    Text("your password manager & generator"),
                  ],
                ),
                Column(
                  children: [
                    HomeButton("Generator", "green", handleGenerator),
                    HomeButton("Safe", "blue", handleSafe),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: RaisedButton(
                        onPressed: handleSettings,
                        child: Text(
                          "Settings",
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      width: 200.0,
                    ),
                    Text("v1.0 - 2020"),
                    Text("NeakApps"),
                  ],
                )
              ],
            ))));
  }
}

// class Test extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }
