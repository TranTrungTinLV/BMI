import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/reusableCard.dart';
import 'icon_content.dart';
import 'result_page.dart';
import 'carculator_brain.dart';

const bottomHeight = 80.0;

const ColorBottom = Color(0xFFEB15555);
const inactivecolor = Color(0XFF1D1E3);
const activeColor = Color(0xFFB2EBF2);

enum Gender { male, female }

class InpugPage extends StatefulWidget {
  @override
  State<InpugPage> createState() => _InpugPageState();
}

class _InpugPageState extends State<InpugPage> {
  Gender? SelectedGender;
  int height = 180;
  int weight = 2;
  int age = 0;
  // Color maleCardColour = inactivecolor;
  // Color femaleCardColour = inactivecolor;
  //
  // // male = 1 , female = 0
  // void updateColour(Gender SelectedGender) {
  //   // if (SelectedGender == Gender.male) {
  //   //   if (maleCardColour == inactivecolor) {
  //   //     maleCardColour = activeColor;
  //   //   } else {
  //   //     maleCardColour = inactivecolor;
  //   //   }
  //   // }
  //
  //   SelectedGender = Gender.male ?
  //   if(SelectedGender == Gender.female) {
  //     if (femaleCardColour == inactivecolor) {
  //       femaleCardColour = activeColor;
  //     } else {
  //       femaleCardColour = inactivecolor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'BMI Caculation',
            style: TextStyle(fontSize: 30),
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          SelectedGender = Gender.male;
                        });
                      },
                      child: ReuSableCard(
                        coulor: SelectedGender == Gender.male
                            ? activeColor
                            : inactivecolor,
                        cardChild: SEX(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          SelectedGender = Gender.female;
                        });
                      },
                      child: ReuSableCard(
                        coulor: SelectedGender == Gender.female
                            ? activeColor
                            : inactivecolor,
                        cardChild: SEX(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReuSableCard(
                  coulor: Color(0XFF1D1E3),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: TextStyle(fontSize: 40),
                          ),
                          Text('cm')
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Color(0xFFF06292),
                        inactiveColor: Color(0xFFF880E4F),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReuSableCard(
                    coulor: Color(0XFF1D1E3),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT'),
                        Text(weight.toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.add,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.subtract,
                                size: 40,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReuSableCard(
                    coulor: Color(0XFF1D1E3),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE'),
                        Text(
                          age.toString(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.subtract,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Caculatorbrain calc =
                    Caculatorbrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Result(
                        bmiResult: calc.caculatorBMI(),
                        resultText: calc.getResult(),
                        resultInterpretation: calc.getIntergretation(),
                      );
                    },
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CACULE',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                color: ColorBottom,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomHeight,
              ),
            )
          ],
        ));
  }
}
