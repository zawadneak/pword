import 'package:flutter/material.dart';
import 'package:pword/constants/colors.dart';

class CheckBoxModel {
  CheckBoxModel({this.text, this.checked = false});

  String text;
  bool checked;
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({Key key, this.item}) : super(key: key);

  final CheckBoxModel item;

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Constants.green,
      title: Text(
        widget.item.text,
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      value: widget.item.checked,
      onChanged: (bool value) {
        setState(() {
          widget.item.checked = value;
        });
      },
    );
  }
}
