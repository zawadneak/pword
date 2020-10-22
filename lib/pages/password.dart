import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_strength/password_strength.dart';
import 'dart:math';
import '../constants/colors.dart';
import '../constants/passwordChars.dart';
import '../widgets/checkBox.dart';
import '../widgets/generalButton.dart';
import '../widgets/Alert.dart';

import './safe.dart';

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
    CheckBoxModel(text: "Use noun"),
  ];

  double passwordLength = 10;
  double strength = 0.3;
  bool isGenerated = false;
  String currentPassword = "";
  String description = "";

  @override
  Widget build(BuildContext context) {
    void handleGoBack() {
      Navigator.pop(context);
    }

    int printableSliderValue = passwordLength.round();

    List getCharArray() {
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

      return charArray;
    }

    int generateRandomString() {
      final random = Random();

      final charArray = getCharArray();

      if (charArray.isEmpty ?? true) {
        Alert().alert(context,
            "You need to select at least one option besides use common words!");
        return 1;
      }
      final charString = charArray.join();

      final generatedPassword = List.generate(printableSliderValue,
          (index) => charString[random.nextInt(charString.length)]).join();

      if (options[4].checked) {
        final index = random.nextInt(PasswordChars.randomNouns.length);
        final noun = PasswordChars.randomNouns[index];
        String nounPassword;
        nounPassword = generatedPassword.replaceRange(0, noun.length, noun);

        final estimateStrenght = estimatePasswordStrength(nounPassword);

        setState(() {
          currentPassword = nounPassword;
          strength = estimateStrenght;
        });

        return 0;
      }

      setState(() {
        currentPassword = generatedPassword;
        strength = estimatePasswordStrength(generatedPassword);
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
      Clipboard.setData(ClipboardData(text: currentPassword));
      Alert().alert(
          context, "Password copied to clipboard! Thank you for using pword.");
    }

    void handleSave() {
      Navigator.pushNamed(context, '/safe',
          arguments: SafeItem(currentPassword, description));
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
                      Text("Password Length: $printableSliderValue",
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
                        Text(currentPassword,
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
                                strength > 0.7
                                    ? Color(0xff00ff00)
                                    : strength > 0.5
                                        ? Colors.orange
                                        : Colors.red,
                              ),
                              backgroundColor: Color(0xffD6D6D6),
                            ),
                          ),
                        ),
                        Text('Strength'),
                        Text(
                          strength > 0.7
                              ? "strong"
                              : strength > 0.5
                                  ? "average"
                                  : "weak",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              color: strength > 0.7
                                  ? Color(0xff00ff00)
                                  : strength > 0.5
                                      ? Colors.orange
                                      : Colors.red,
                              fontSize: 24.0),
                        ),
                        SizedBox(height: 10),
                        Text(
                          strength < 0.7
                              ? "To increase the score, select more\noptions at the generation menu."
                              : "",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        GeneralButton("Copy", handleCopy),
                        SizedBox(height: 10),
                        GeneralButton("Save", handleSave)
                      ])));
  }
}
