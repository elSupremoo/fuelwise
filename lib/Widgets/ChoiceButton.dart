import 'package:flutter/material.dart';
import 'package:fuel_wise/Screens/VehicleConfig.dart';

class ChoiceButton extends StatefulWidget {
  final VoidCallback onPressed;
  const ChoiceButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 60,
        width: 300,
        child: Center(
          child: Text(
            "Button",
            style: TextStyle(
              fontFamily: "League Gothic",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 245, 245, 220),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color.fromARGB(255, 138, 129, 124),
        ),
      ),
    );
  }
}
