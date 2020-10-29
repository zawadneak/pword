import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'GeneralButton.dart';

class DeleteAlert {
  Future<void> alert(
    context,
    String alertTitle,
    Function handleDelete,
  ) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(alertTitle, style: TextStyle(fontSize: 18.0)),
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      GeneralButton("confirm".tr, handleDelete),
                    ],
                  ))
            ],
          );
        });
  }
}
