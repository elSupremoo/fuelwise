import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fuel_wise/Models/CurrentConfig.dart';
import 'package:fuel_wise/Models/selectedcar.dart';
import 'package:fuel_wise/Screens/ResultScreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(36.1674, -86.8036);

  LatLng? _startLocation;
  LatLng? _endLocation;
  String _tripTime = "";
  String _tripDistance = "";
  int _numStops = 0;
  List<String> stopLocations = [];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onMapTapped(LatLng tappedPoint) {
    setState(() {
      if (_startLocation == null) {
        _startLocation = tappedPoint;
      } else if (_endLocation == null) {
        _endLocation = tappedPoint;
        _fetchTripWithStops();
      } else {
        _startLocation = tappedPoint;
        _endLocation = null;
        _tripTime = "";
        _tripDistance = "";
        _numStops = 0;
        stopLocations = [];
      }
    });
  }

  Future<void> _fetchTripWithStops() async {
    if (_startLocation != null && _endLocation != null) {
      final apiKey = "use your key here";

      Map<String, dynamic>? car = SelectedCar.getSelectedCar();

      int range = 100;

      if (car != null) {
        range = car['fullTank'];
      }

      print(range);

      final url = Uri.parse(
          'https://maps.googleapis.com/maps/api/directions/json?origin=${_startLocation!.latitude},${_startLocation!.longitude}&destination=${_endLocation!.latitude},${_endLocation!.longitude}&mode=driving&key=$apiKey');

      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final routeLegs = data['routes'][0]['legs'][0]['steps'];
          double distanceCovered = 0;
          stopLocations = [];

          for (var leg in routeLegs) {
            final stepDistance = leg['distance']['value'] / 1609.34;
            distanceCovered += stepDistance;

            if (distanceCovered >= range) {
              final refuelStop =
                  await _findNearestGasStation(leg['end_location']);
              stopLocations
                  .add('${refuelStop.latitude},${refuelStop.longitude}');
              distanceCovered = 0;
              _numStops++;
            }
          }

          CurrentConfig.setNumStops(_numStops);

          stopLocations
              .add('${_endLocation!.latitude},${_endLocation!.longitude}');

          setState(() {
            _tripTime = data['routes'][0]['legs'][0]['duration']['text'];
            _tripDistance = data['routes'][0]['legs'][0]['distance']['text'];
          });
        } else {
          throw Exception('Failed to fetch directions');
        }
      } catch (e) {
        print("Error fetching trip: $e");
      }
    }
  }

  Future<LatLng> _findNearestGasStation(dynamic location) async {
    final apiKey = "use your key here";
    final placesUrl = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${location['lat']},${location['lng']}&radius=5000&type=gas_station&key=$apiKey');

    try {
      final response = await http.get(placesUrl);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final firstGasStation = data['results'][0];
        return LatLng(firstGasStation['geometry']['location']['lat'],
            firstGasStation['geometry']['location']['lng']);
      } else {
        throw Exception('Failed to fetch gas stations');
      }
    } catch (e) {
      print("Error fetching gas station: $e");
      return LatLng(location['lat'], location['lng']);
    }
  }

  String _buildGoogleMapsUrl(List<String> stopLocations) {
    final stopsParam =
        stopLocations.sublist(0, stopLocations.length - 1).join('|');
    return 'https://www.google.com/maps/dir/?api=1&origin=${_startLocation!.latitude},${_startLocation!.longitude}&destination=${_endLocation!.latitude},${_endLocation!.longitude}&waypoints=$stopsParam&travelmode=driving';
  }

  Future<void> _launchMapsUrl() async {
    if (_startLocation != null &&
        _endLocation != null &&
        stopLocations.isNotEmpty) {
      final Uri googleMapsUri = Uri.parse(_buildGoogleMapsUrl(stopLocations));
      if (await canLaunchUrl(googleMapsUri)) {
        await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch the map URL';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      time: _tripTime,
                      distance: _tripDistance,
                      openMaps: _launchMapsUrl,
                    ),
                  ),
                );
              },
              child: Text(
                "Next",
                style: TextStyle(color: Color.fromARGB(255, 245, 245, 220)),
              ),
              shape: CircleBorder(),
              backgroundColor: Color.fromARGB(255, 138, 129, 124),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 70, 63, 58),
        appBar: AppBar(
          title: Text("FuelWise"),
          backgroundColor: Color.fromARGB(255, 138, 129, 124),
        ),
        body: Column(
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _center, zoom: 10.0),
                onMapCreated: _onMapCreated,
                onTap: _onMapTapped,
                markers: {
                  if (_startLocation != null)
                    Marker(
                      markerId: MarkerId('start'),
                      position: _startLocation!,
                      infoWindow: InfoWindow(title: 'Start Location'),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen),
                    ),
                  if (_endLocation != null)
                    Marker(
                      markerId: MarkerId('end'),
                      position: _endLocation!,
                      infoWindow: InfoWindow(title: 'End Location'),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed),
                    ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
