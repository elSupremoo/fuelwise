import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final String category;
  const ResultText({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      style: TextStyle(
          fontFamily: "League Gothic",
          color: Color.fromARGB(255, 245, 245, 220),
          fontSize: 30),
    );
  }
}
