import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_strength/password_strength.dart';
import 'dart:math';
import 'package:get/get.dart';
import '../controllers/safe.dart';
import '../models/safeItem.dart';
import '../constants/colors.dart';
import '../constants/passwordChars.dart';
import '../widgets/checkBox.dart';
import '../widgets/generalButton.dart';
import '../widgets/Alert.dart';
import '../widgets/StoreAlert.dart';

import './safe.dart';

class Password extends StatefulWidget {
  @override
  PasswordState createState() => PasswordState();
}

class PasswordState extends State<Password> {
  final List<CheckBoxModel> options = [
    CheckBoxModel(text: 'uppercase'.tr),
    CheckBoxModel(text: 'lowercase'.tr),
    CheckBoxModel(text: 'symbols'.tr),
    CheckBoxModel(text: "numbers".tr),
    CheckBoxModel(text: "noun".tr),
  ];

  final SafeController controller = Get.put(SafeController());

  double passwordLength = 10;
  double strength = 0.3;
  bool isGenerated = false;
  String currentPassword = "";

  bool isSaving = false;
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
        Alert().alert(context, 'invalid_submit'.tr);
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
        nounPassword =
            "${nounPassword[0].toUpperCase()}${nounPassword.substring(1)}";

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
      Alert().alert(context, 'pass_copied'.tr);
    }

    void handleTextChange(String text) {
      setState(() {
        description = text;
      });
    }

    void handleStorePassword() {
      controller.push(SafeItem(currentPassword, description));
      Navigator.pushNamed(context, '/safe',
          arguments: SafeItem(currentPassword, description));
    }

    void handleSave() {
      StoreAlert().alert(
          context, 'store_password'.tr, handleTextChange, handleStorePassword);
    }

    void handleReset() {
      setState(() {
        isGenerated = false;
        strength = 0.3;
        currentPassword = "";
      });
    }

    return Scaffold(
        body: Center(
            child: !isGenerated
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "generate_password".tr,
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
                      Text("pass_length".tr + " $printableSliderValue",
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
                      GeneralButton("generate".tr, handleGenerate)
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
                        Text('strength'.tr),
                        Text(
                          strength > 0.7
                              ? "strong".tr
                              : strength > 0.5
                                  ? "average".tr
                                  : "weak".tr,
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
                          strength < 0.7 ? "increase_score".tr : "",
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        GeneralButton("copy".tr, handleCopy),
                        SizedBox(height: 10),
                        GeneralButton("save".tr, handleSave),
                        SizedBox(height: 20),
                        FlatButton(
                            onPressed: handleReset,
                            child: Text(
                              "generate_password".tr,
                              style: TextStyle(fontFamily: "Montserrat"),
                            ))
                      ])));
  }
}
