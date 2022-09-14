import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  fontSize: 20,
);

class SEX extends StatelessWidget {
  SEX({this.icon, this.label});

  final IconData? icon;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label!,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
