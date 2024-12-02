import 'package:flutter/material.dart';
import 'package:fuel_wise/Functions/costCalc.dart';
import 'package:fuel_wise/Models/CurrentConfig.dart';
import 'package:fuel_wise/Screens/ExportScreen.dart';
import 'package:fuel_wise/Screens/VehicleConfig.dart';
import 'package:fuel_wise/Widgets/ResultNumber.dart';
import 'package:fuel_wise/Widgets/ResultText.dart';

class ResultScreen extends StatelessWidget {
  final String time;
  final String distance;
  final VoidCallback openMaps;
  const ResultScreen({
    super.key,
    required this.time,
    required this.openMaps,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 70, 63, 58),
        appBar: AppBar(
          title: Text("FuelWise"),
          backgroundColor: Color.fromARGB(255, 138, 129, 124),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResultText(
                category: "Total Cost",
              ),
              ResultNumber(
                numberValue: "\$${costCalc(distance)}",
              ),
              ResultText(
                category: "Total Distance",
              ),
              ResultNumber(
                numberValue: distance,
              ),
              ResultText(
                category: "Total Time",
              ),
              ResultNumber(
                numberValue: time,
              ),
              ResultText(
                category: "Total Stops",
              ),
              ResultNumber(
                numberValue: CurrentConfig.numStops.toString(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ExportScreen(openMaps: openMaps)));
          },
          shape: CircleBorder(),
          child: Text(
            "Next",
            style: TextStyle(
              color: Color.fromARGB(255, 245, 245, 220),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 138, 129, 124),
        ),
      ),
    );
  }
}
