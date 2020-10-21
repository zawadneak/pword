import 'package:flutter/material.dart';
import '../widgets/safeBox.dart';

class Safe extends StatefulWidget {
  @override
  SafeState createState() => SafeState();
}

class SafeState extends State<Safe> {
  @override
  Widget build(BuildContext context) {
    void handleGoBack() {
      Navigator.pop(context);
    }

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Password Safe",
          style: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.w700,
              fontSize: 21.0),
        ),
        SafeBox("Apple", "123")
      ],
    )));
  }
}
