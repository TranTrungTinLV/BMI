import 'package:flutter/material.dart';

class ReuSableCard extends StatelessWidget {
  ReuSableCard({@required this.coulor, this.cardChild});
  final Color? coulor;
  final Widget? cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: coulor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
