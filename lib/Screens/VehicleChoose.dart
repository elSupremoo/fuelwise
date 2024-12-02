import 'package:flutter/material.dart';
import 'package:fuel_wise/Widgets/ChoiceButton.dart';

class VehicleChoose extends StatefulWidget {
  const VehicleChoose({super.key});

  @override
  State<VehicleChoose> createState() => _VehicleChooseState();
}

class _VehicleChooseState extends State<VehicleChoose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 70, 63, 58),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'FuelWise',
                style: TextStyle(
                    fontFamily: "League Gothic",
                    fontSize: 66,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                    color: Color.fromARGB(255, 245, 245, 220)),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "Select your vehicle",
                style: TextStyle(color: Color.fromARGB(255, 245, 245, 220)),
              ),
              SizedBox(
                height: 40,
              ),
              ChoiceButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/config');
                },
              ),
              SizedBox(
                height: 50,
              ),
              ChoiceButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/config');
                },
              ),
              SizedBox(
                height: 50,
              ),
              ChoiceButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/config');
                },
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ));
  }
}
