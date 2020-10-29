import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controllers/safe.dart';
import '../widgets/homeButton.dart';

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  final SafeController controller = Get.put(SafeController());
  @override
  void initState() {
    super.initState();
    controller.load();
  }

  @override
  Widget build(BuildContext context) {
    void handleGenerator() {
      Navigator.pushNamed(context, '/password');
    }

    void handleSafe() {
      Navigator.pushNamed(context, '/safe');
    }

    void handleSettings() {
      Navigator.pushNamed(context, '/settings');
    }

    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'welcome'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 21.0,
                      ),
                    ),
                    Text('welcome_sub'.tr),
                  ],
                ),
                Column(
                  children: [
                    HomeButton('generator'.tr, "green", handleGenerator),
                    HomeButton('safe'.tr, "blue", handleSafe),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: RaisedButton(
                        onPressed: handleSettings,
                        child: Text(
                          'settings'.tr,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      width: 200.0,
                    ),
                    Text("v1.0 - 2020"),
                    Text("NeakApps"),
                  ],
                )
              ],
            ))));
  }
}
