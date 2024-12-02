import 'package:flutter/material.dart';

class ResultNumber extends StatelessWidget {
  final String numberValue;
  const ResultNumber({super.key, required this.numberValue});

  @override
  Widget build(BuildContext context) {
    return Text(
      numberValue,
      style: TextStyle(
          fontFamily: "League Gothic",
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 245, 245, 220),
          fontSize: 50),
    );
  }
}
