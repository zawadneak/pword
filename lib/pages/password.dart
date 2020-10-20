import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/checkBox.dart';
import '../widgets/generalButton.dart';

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

  double sliderValue = 10;
  double strength = 0.3;
  bool isGenerated = false;
  String password = "";

  void handleGenerate() {
    setState(() {
      isGenerated = !isGenerated;
    });
  }

  @override
  Widget build(BuildContext context) {
    void handleGoBack() {
      Navigator.pop(context);
    }

    void handleSave() {
      Navigator.pushNamed(context, '/safe');
    }

    int printableSliderValue = sliderValue.round();

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
                          value: sliderValue,
                          min: 10,
                          max: 25,
                          divisions: 3,
                          activeColor: Constants.green,
                          inactiveColor: Colors.grey,
                          onChanged: (double value) {
                            setState(() {
                              sliderValue = value;
                            });
                          }),
                      GeneralButton("Generate", handleGenerate)
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text('asdasdasdasdasdasdasdasda',
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
                        GeneralButton("Copy", handleGenerate),
                        SizedBox(height: 10),
                        GeneralButton("Save", handleSave)
                      ])));
  }
}
