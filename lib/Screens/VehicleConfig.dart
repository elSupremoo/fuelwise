import 'package:flutter/material.dart';
import 'package:fuel_wise/Models/CurrentConfig.dart';
import 'package:fuel_wise/Models/selectedcar.dart';
import 'package:fuel_wise/Widgets/ChoiceButton.dart';

class VehicleConfig extends StatefulWidget {
  const VehicleConfig({super.key});

  @override
  State<VehicleConfig> createState() => _VehicleConfigState();
}

class _VehicleConfigState extends State<VehicleConfig> {
  final _adultsController = TextEditingController();
  final _childrenController = TextEditingController();
  final _fuelController = TextEditingController();
  final _weightController = TextEditingController();

  void _saveValues() {
    CurrentConfig.setNumAdults(int.tryParse(_adultsController.text) ?? 0);
    CurrentConfig.setNumChildren(int.tryParse(_childrenController.text) ?? 0);
    CurrentConfig.setCargoWeight(double.tryParse(_fuelController.text) ?? 0.0);
    CurrentConfig.setTrailerWeight(
        double.tryParse(_weightController.text) ?? 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 70, 63, 58),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _saveValues();
            Navigator.pushNamed(context, '/map');
          },
          child: Text(
            "Next",
            style: TextStyle(color: Color.fromARGB(255, 245, 245, 220)),
          ),
          shape: CircleBorder(),
          backgroundColor: Color.fromARGB(255, 138, 129, 124),
        ),
        appBar: AppBar(
          title: Text("FuelWise"),
          backgroundColor: Color.fromARGB(255, 138, 129, 124),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Select current cofiguration for",
                  style: TextStyle(
                      color: Color.fromARGB(255, 245, 245, 220), fontSize: 16),
                ),
                Text(
                  "${SelectedCar.getSelectedCar()?['year']} ${SelectedCar.getSelectedCar()?['make']} ${SelectedCar.getSelectedCar()?['model']}" ??
                      'No car selected',
                  style: TextStyle(
                      color: Color.fromARGB(255, 245, 245, 220), fontSize: 16),
                ),
                TextField(
                  controller: _adultsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Number of Adults',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                TextField(
                  controller: _childrenController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Number of Children',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                TextField(
                  controller: _fuelController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Cargo Weight in lbs',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Trailer Weight in lbs',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
