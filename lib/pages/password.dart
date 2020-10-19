import 'package:flutter/material.dart';

class Password extends StatefulWidget {
  @override
  PasswordState createState() => PasswordState();
}

class PasswordState extends State<Password> {
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
