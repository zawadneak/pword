import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
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
