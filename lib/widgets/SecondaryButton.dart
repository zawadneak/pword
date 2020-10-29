import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final Function handleClick;

  SecondaryButton(this.title, this.handleClick);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: handleClick,
      child: Text(
        title,
        style: TextStyle(fontFamily: 'Montserrat', color: Colors.grey),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    );
  }
}
