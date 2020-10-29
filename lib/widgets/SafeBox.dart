import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pword/constants/colors.dart';
import 'package:get/get.dart';
import './Alert.dart';

class SafeBox extends StatefulWidget {
  final String description;
  final String password;
  final Function handleDelete;

  SafeBox(this.description, this.password, this.handleDelete);

  @override
  SafeBoxWidget createState() => SafeBoxWidget();
}

class SafeBoxWidget extends State<SafeBox> {
  bool hidden = true;

  void handleVisibility() {
    setState(() {
      hidden = !hidden;
    });
  }

  void handleCopy() {
    Clipboard.setData(ClipboardData(text: widget.password));
    Alert().alert(context, 'pass_copied'.tr);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(244, 244, 244, 1)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "description".tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  widget.description,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "OpenSans",
                      fontSize: 20),
                ),
                SizedBox(height: 20),
                Text(
                  "password".tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "OpenSans",
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  hidden ? "******" : widget.password,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "OpenSans",
                      fontSize: 20),
                ),
              ],
            )),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: widget.handleDelete,
                  child: Icon(Icons.delete,
                      size: 30, color: Color.fromRGBO(196, 196, 196, 1)),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: handleVisibility,
                  child: Icon(hidden ? Icons.visibility : Icons.visibility_off,
                      size: 30, color: Color.fromRGBO(196, 196, 196, 1)),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () => handleCopy(),
                  child: Icon(Icons.file_copy, size: 30, color: Constants.blue),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
