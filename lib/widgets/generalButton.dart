import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final Function handleClick;

  GeneralButton(this.text, this.handleClick);

  static const green = Color.fromRGBO(122, 210, 204, 1);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: handleClick,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        child: Text(
          this.text,
          style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
        ),
        color: green);
  }
}
