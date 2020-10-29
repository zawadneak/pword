import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/Alert.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  void handleSupporters() {
    Alert().alert(context, "icon".tr);
  }

  Future handleRate() async {
    const url = 'https://play.google.com/store/apps/details?id=com.lcdev.pword';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('failed');
    }
  }

  Future handleDeveloper() async {
    const url = 'https://lucaszawadneak.me';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    void handleGoBack() {
      Navigator.pop(context);
    }

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: handleSupporters,
          child: SizedBox(
            child: Text('supporters'.tr),
            width: 200,
          ),
        ),
        RaisedButton(
          onPressed: handleRate,
          child: SizedBox(
            child: Text('rate'.tr),
            width: 200,
          ),
        ),
        RaisedButton(
          onPressed: handleDeveloper,
          child: SizedBox(
            child: Text('developer'.tr),
            width: 200,
          ),
        ),
        RaisedButton(onPressed: handleGoBack, child: Text('back'.tr)),
      ],
    )));
  }
}
