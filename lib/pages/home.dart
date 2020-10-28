import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import '../controllers/safe.dart';
import '../controllers/auth.dart';
import '../widgets/homeButton.dart';

class Main extends StatefulWidget {
  @override
  MainState createState() => MainState();
}

class MainState extends State<Main> {
  final SafeController controller = Get.put(SafeController());
  final AuthController authController = Get.put(AuthController());

  final LocalAuthentication auth = LocalAuthentication();

  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } catch (e) {
      print(e);
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  @override
  void initState() {
    super.initState();
    _authenticate();
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
