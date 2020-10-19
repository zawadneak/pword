import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final String colorType;
  final Function handleClick;

  HomeButton(this.text, this.colorType, this.handleClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
        color: this.colorType == 'blue' ? Colors.blue : Colors.green,
        onPressed: handleClick,
        child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$text',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          width: 400.0,
          height: 200.0,
        ),
      ),
    );
  }
}
