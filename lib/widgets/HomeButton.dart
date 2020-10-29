import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final String colorType;
  final Function handleClick;

  HomeButton(this.text, this.colorType, this.handleClick);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: this.colorType == 'blue' ? Constants.blue : Constants.green,
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
                    width: 180.0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
