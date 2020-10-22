import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'dart:math';
import '../constants/colors.dart';
import '../constants/passwordChars.dart';
import '../widgets/checkBox.dart';
import '../widgets/generalButton.dart';
import '../widgets/Alert.dart';

class Password extends StatefulWidget {
  @override
  PasswordState createState() => PasswordState();
}

class PasswordState extends State<Password> {
  final List<CheckBoxModel> options = [
    CheckBoxModel(text: "Uppercase letters"),
    CheckBoxModel(text: "Lowercase letters"),
    CheckBoxModel(text: "Symbols"),
    CheckBoxModel(text: "Numbers"),
    CheckBoxModel(text: "Use common words"),
  ];

  double passwordLength = 10;
  double strength = 0.3;
  bool isGenerated = false;
  String password = "";

  @override
  Widget build(BuildContext context) {
    void handleGoBack() {
      Navigator.pop(context);
    }

    void handleSave() {
      Navigator.pushNamed(context, '/safe');
    }

    int printableSliderValue = passwordLength.round();

    int generateRandomString() {
      final random = Random();
      var charArray = [];
      if (options[0].checked) {
        charArray.add(PasswordChars.uppercase);
      }
      if (options[1].checked) {
        charArray.add(PasswordChars.lowercase);
      }
      if (options[2].checked) {
        charArray.add(PasswordChars.symbols);
      }
      if (options[3].checked) {
        charArray.add(PasswordChars.numbers);
      }

      if (charArray.isEmpty ?? true) {
        Alert().alert(context,
            "You need to select at least one option besides use common words!");
        return 1;
      }
      final charString = charArray.join();

      final generatedPassword = List.generate(printableSliderValue,
          (index) => charString[random.nextInt(charString.length)]).join();

      bool commonWordUsed = false;
      String commonWordPassword = "";

      if (options[4].checked) {
        final index = random.nextInt(PasswordChars.commonWords.length);
        final commonWord = PasswordChars.commonWords[index];

        setState(() {
          commonWordUsed = true;
          commonWordPassword =
              generatedPassword.replaceRange(0, commonWord.length, commonWord);
        });
      }

      setState(() {
        password = commonWordUsed ? commonWordPassword : generatedPassword;
      });
      return 0;
    }

    void handleGenerate() {
      final resultInt = generateRandomString();

      if (resultInt == 0) {
        setState(() {
          isGenerated = !isGenerated;
        });
      }
    }

    void handleCopy() {
      FlutterClipboard.copy(password);
    }

    return Scaffold(
        body: Center(
            child: !isGenerated
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Generate new password",
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w700,
                            fontSize: 21.0),
                      ),
                      Container(
                          child: SizedBox(
                        child: ListView.builder(
                          itemCount: options.length,
                          itemBuilder: (_, int index) {
                            return CheckboxWidget(item: options[index]);
                          },
                        ),
                        height: 320.0,
                      )),
                      Text("Max Length: $printableSliderValue",
                          style: TextStyle(
                              fontFamily: "OpenSans", fontSize: 14.0)),
                      Slider(
                          value: passwordLength,
                          min: 10,
                          max: 25,
                          divisions: 3,
                          activeColor: Constants.green,
                          inactiveColor: Colors.grey,
                          onChanged: (double value) {
                            setState(() {
                              passwordLength = value;
                            });
                          }),
                      GeneralButton("Generate", handleGenerate)
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text(password,
                            style: TextStyle(
                                fontFamily: "Montserrat", fontSize: 21.0)),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: 300,
                          height: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: LinearProgressIndicator(
                              value: strength,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Color(0xff00ff00)),
                              backgroundColor: Color(0xffD6D6D6),
                            ),
                          ),
                        ),
                        Text('Strength'),
                        Text(
                          'weak',
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: Colors.red,
                              fontSize: 24.0),
                        ),
                        SizedBox(height: 10),
                        GeneralButton("Copy", handleCopy),
                        SizedBox(height: 10),
                        GeneralButton("Save", handleSave)
                      ])));
  }
}
