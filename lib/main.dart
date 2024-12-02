import 'package:flutter/material.dart';
import 'package:fuel_wise/Functions/carinfofetch.dart';
import 'package:fuel_wise/Functions/databasehelper.dart';
import 'package:fuel_wise/Screens/MapScreen.dart';
import 'package:fuel_wise/Screens/VehicleConfig.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.instance.deleteDatabaseFile();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => CarSearchScreen(),
        '/config': (context) => VehicleConfig(),
        '/map': (context) => MapScreen(),
      },
    );
  }
}
