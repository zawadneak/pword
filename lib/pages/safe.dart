import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/safe.dart';
import '../widgets/safeBox.dart';
import '../widgets/Alert.dart';

class Safe extends StatefulWidget {
  @override
  SafeState createState() => SafeState();
}

class SafeState extends State<Safe> {
  final SafeController controller = Get.put(SafeController());

  @override
  Widget build(BuildContext context) {
    void handleGoBack() {
      Navigator.pop(context);
    }

    double width = MediaQuery.of(context).size.width;

    void handleDelete(int index) {
      controller.sub(index);
      Navigator.pushNamed(context, '/');
      Alert().alert(context, "This password was deleted!");
    }

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: Text(
            "Password Safe",
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w700,
                fontSize: 21.0),
          ),
        ),
        Container(
            child: Expanded(
          flex: 1,
          child: Padding(
            child: GetBuilder<SafeController>(
              builder: (item) => ListView.builder(
                itemCount: item.passwords.length,
                itemBuilder: (_, int index) {
                  return SafeBox(
                      item.passwords[index].description,
                      item.passwords[index].password,
                      () => handleDelete(index));
                },
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30),
          ),
        )),
      ],
    )));
  }
}
