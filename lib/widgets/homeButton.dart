import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final String colorType;
  final Function handleClick;

  HomeButton(this.text, this.colorType, this.handleClick);

  static const blue = Color.fromRGBO(125, 191, 212, 1);
  static const green = Color.fromRGBO(122, 210, 204, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: this.colorType == 'blue' ? blue : green,
        onPressed: handleClick,
        child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(),
                Text(
                  '$text',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 24.0),
                ),
                Image.asset(
                  this.colorType == 'blue'
                      ? 'lib/assets/img/safe.jpg'
                      : 'lib/assets/img/gear.jpg',
                  width: 200.0,
                ),
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
