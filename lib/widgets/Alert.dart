import 'package:flutter/material.dart';

class Alert {
  Future<void> alert(context, String alertTitle) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(alertTitle, style: TextStyle(fontSize: 18.0)),
            children: [
              SizedBox(
                height: 0,
              )
            ],
          );
        });
  }
}
