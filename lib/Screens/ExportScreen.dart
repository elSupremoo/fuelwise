import 'package:flutter/material.dart';

class ExportScreen extends StatelessWidget {
  final VoidCallback openMaps;
  const ExportScreen({super.key, required this.openMaps});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 70, 63, 58),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 138, 129, 124)),
                onPressed: () {
                  openMaps();
                },
                child: Text(
                  "Open in google maps",
                  style: TextStyle(color: Color.fromARGB(255, 245, 245, 220)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
