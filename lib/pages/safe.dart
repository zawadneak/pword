import 'package:flutter/material.dart';

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
      child: RaisedButton(
        onPressed: handleGoBack,
        child: Text('Voltar'),
      ),
    ));
  }
}
