import 'package:flutter/material.dart';
import 'reusableCard.dart';

class Result extends StatelessWidget {
  Result({
    required String this.bmiResult,
    required String this.resultText,
    required String this.resultInterpretation,
  });
  final String bmiResult;
  final String resultText;
  final String resultInterpretation;
  @override
  Widget build(BuildContext context) {
    int height = 30;

    return Scaffold(
      appBar: AppBar(
        title: Text('Result BMI OF You'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'BMI DARK',
                style: TextStyle(fontSize: 40),
              ),
            )),
            Expanded(
                flex: 5,
                child: ReuSableCard(
                  coulor: Color(0XFF1D1E3),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText,
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(fontSize: 100, color: Colors.white),
                      ),
                      Text(
                        resultInterpretation,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CACULE',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                color: Color(0xFFEB15555),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 80.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
