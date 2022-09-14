import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMI());

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Color(0XFF0A0E21),
          ),
          scaffoldBackgroundColor: Color(0XFF0A0E21),
          //changing color top

          textTheme: TextTheme(
              bodyText2: TextStyle(
                  color: Color(0XFFFFFFFFF),
                  fontSize: 20)) // changing color body
          ),
      home: InpugPage(),
    );
  }
}
