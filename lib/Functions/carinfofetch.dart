import 'package:flutter/material.dart';
import 'package:fuel_wise/Functions/databasehelper.dart';
import 'package:fuel_wise/Models/selectedcar.dart';

class CarSearchScreen extends StatefulWidget {
  @override
  _CarSearchScreenState createState() => _CarSearchScreenState();
}

class _CarSearchScreenState extends State<CarSearchScreen> {
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  List<Map<String, dynamic>> _results = [];

  Future<void> _searchCar() async {
    String make = _makeController.text;
    String model = _modelController.text;
    int year = int.tryParse(_yearController.text) ?? 0;

    List<Map<String, dynamic>> results =
        await DatabaseHelper.instance.searchCar(make, model, year);
    setState(() {
      _results = results;
    });
  }

  void _selectCar(Map<String, dynamic> car) {
    setState(() {
      SelectedCar.setSelectedCar(car);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 70, 63, 58),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
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
              TextField(
                controller: _makeController,
                decoration: InputDecoration(
                    labelText: 'Make',
                    labelStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
              ),
              TextField(
                  controller: _modelController,
                  decoration: InputDecoration(
                    labelText: 'Model',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white)),
              TextField(
                  controller: _yearController,
                  decoration: InputDecoration(
                      labelText: 'Year',
                      labelStyle: TextStyle(color: Colors.white)),
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _searchCar,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 138, 129, 124)),
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Color.fromARGB(255, 245, 245, 220),
                  ),
                ),
              ),
              if (_results.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: _results.length,
                    itemBuilder: (context, index) {
                      final car = _results[index];
                      return ListTile(
                        title: Text(
                          '${car['make']} ${car['model']} (${car['year']})',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          _selectCar(car);
                          Navigator.pushNamed(context, "/config");
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
