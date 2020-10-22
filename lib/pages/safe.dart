import 'package:flutter/material.dart';
import '../widgets/safeBox.dart';

class SafeItem {
  final String password;
  final String description;

  SafeItem(this.password, this.description);
}

class Safe extends StatefulWidget {
  @override
  SafeState createState() => SafeState();
}

class SafeState extends State<Safe> {
  List<SafeItem> passwords = [SafeItem("password", "description")];

  @override
  Widget build(BuildContext context) {
    void handleGoBack() {
      Navigator.pop(context);
    }

    double width = MediaQuery.of(context).size.width;

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
        Container(
            child: SizedBox(
          child: ListView.builder(
            itemCount: passwords.length,
            itemBuilder: (_, int index) {
              return SafeBox(
                  passwords[index].description, passwords[index].password);
            },
          ),
          height: 320.0,
          width: width - 60,
        )),
      ],
    )));
  }
}
