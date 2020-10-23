import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/home.dart';
import './pages/password.dart';
import './pages/safe.dart';
import './pages/settings.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'OpenSans'),
      initialRoute: '/',
      routes: {
        '/': (context) => Main(),
        '/password': (context) => Password(),
        '/safe': (context) => Safe(),
        '/settings': (context) => Settings(),
      },
      title: 'pword',
    );
  }
}
