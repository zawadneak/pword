import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import './pages/home.dart';
import './pages/password.dart';
import './pages/safe.dart';
import './pages/settings.dart';

import './controllers/safe.dart';

Future main() async {
  await DotEnv().load('.env');

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
