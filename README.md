# FuelWise

FuelWise is a Flutter app for planning a road trip around a vehicle's fuel range. You choose your vehicle from a local SQLite database, enter what you're carrying, and tap a start and end point on a map. The app gets a driving route from the Google Directions API and adds a refuel stop at a nearby gas station wherever the vehicle's full-tank range runs out. It estimates the trip's fuel cost, adjusted for passenger, cargo and trailer weight, and opens the route with its stops in Google Maps. It's built for US drivers: distances in miles, efficiency in mpg and cost in US dollars.

## Features

- **Vehicle lookup:** search a bundled SQLite table of 134 vehicle records (12 makes, mostly model years 2019-2024) by make, model and year.
- **Load entry:** number of adults and children, plus cargo and trailer weight in pounds.
- **Tap-to-route map:** tap once for the start (green marker) and again for the destination (red marker). A third tap starts a new trip.
- **Automatic refuel stops:** gas stations from a Places API Nearby Search are inserted along the route based on the vehicle's full-tank range.
- **Trip summary:** estimated fuel cost, total distance, drive time and number of refuel stops.
- **Export to Google Maps:** opens the route in Google Maps with the refuel stops as waypoints.

## How it works

### Refuel stops (`lib/Screens/MapScreen.dart`)

1. The app requests a driving route between the two tapped points from the Directions API.
2. It walks the route's steps in order, converting each step's distance from meters to miles and adding it to a running total.
3. When the total reaches the selected vehicle's full-tank range (`fullTank`, in miles), the app runs a Places API Nearby Search (`type=gas_station`, 5 km radius) around the end of that step and uses the first result as a refuel stop. If the lookup fails, it uses the step's end point instead.
4. The total resets to zero and the walk continues to the destination.

### Fuel cost (`lib/Functions/costCalc.dart`)

- Extra load = adults × 160 lb + children × 90 lb + cargo weight + trailer weight
- Adjusted mpg = the vehicle's rated mpg × (1 − 1% for every 100 lb of extra load)
- Cost = route distance in miles ÷ adjusted mpg × $3.00 per gallon (a fixed fuel price)

### Vehicle data (`lib/Functions/databasehelper.dart`)

The vehicle data is seeded in code. `DatabaseHelper` creates `cardetails.db` with a `CarDetails` table (`make`, `model`, `year`, `mpg`, `weight`, `fullTank`) and inserts 134 rows. `main.dart` deletes the database file at every launch, so the app rebuilds it from the seed data each time. Search uses a parameterized exact-match query on make, model and year.

## Tech stack

- **Flutter / Dart** (Dart SDK `^3.5.4`)
- **google_maps_flutter:** interactive map and markers (Maps SDK for Android)
- **Google Directions API** and **Places API (Nearby Search):** web-service calls made with `package:http`
- **sqflite** and **path:** local SQLite vehicle database
- **url_launcher:** opens the exported route in Google Maps

`flutter_dotenv` and `google_fonts` are listed in `pubspec.yaml` but the current code doesn't use them.

## Getting started

### Prerequisites

- Flutter 3.24.4 or later. The project was created on Flutter 3.24.4 (stable).
- An Android device or emulator with Google Play services
- A Google Cloud API key with the **Maps SDK for Android**, **Directions API** and **Places API** enabled. The app calls the original Directions and Places web services, which Google now lists as legacy products. A new Cloud project may not be able to enable them, though existing projects keep working.

### Add your API key

The app reads the key from two places:

1. **Map rendering (Android):** in `android/app/src/main/AndroidManifest.xml`, set the value of the `com.google.android.geo.API_KEY` `<meta-data>` entry to your key.
2. **Directions and Places requests:** in `lib/Screens/MapScreen.dart`, replace the `"use your key here"` placeholder in both `_fetchTripWithStops()` and `_findNearestGasStation()`.

Restrict the key in Google Cloud Console, and don't commit it.

On iOS, the Maps SDK also needs the key in `ios/Runner/AppDelegate.swift` (`GMSServices.provideAPIKey(...)`), as described in the [google_maps_flutter setup guide](https://pub.dev/packages/google_maps_flutter). The project doesn't include that step yet.

### Run

```bash
flutter pub get
flutter run
```

### Using the app

1. Enter the make, model and year exactly as stored (for example `Toyota`, `Camry`, `2020`), tap **Search**, and pick a result.
2. Enter passengers and weights, then tap **Next**.
3. Tap the map to set the start, then the destination. Wait for the route to load, then tap **Next**.
4. Review the trip summary, tap **Next**, then tap **Open in google maps**.

## Project structure

```
lib/
├── main.dart                  # Entry point, routes, database reset on launch
├── Functions/
│   ├── carinfofetch.dart      # Vehicle search screen
│   ├── costCalc.dart          # Load-adjusted fuel cost
│   └── databasehelper.dart    # SQLite schema, seed data, search query
├── Models/
│   ├── CurrentConfig.dart     # Trip load and stop count
│   └── selectedcar.dart       # Selected vehicle
├── Screens/
│   ├── VehicleConfig.dart     # Load entry form
│   ├── MapScreen.dart         # Map, Directions request, refuel stops, export URL
│   ├── ResultScreen.dart      # Trip summary
│   ├── ExportScreen.dart      # Open in Google Maps
│   └── VehicleChoose.dart     # Placeholder screen, not routed
└── Widgets/                   # ChoiceButton, ResultNumber, ResultText
```

## Limitations

- The fuel price is fixed at $3.00 per gallon. Each refuel stop is the first Nearby Search result, not the cheapest station.
- Stops are placed only once the full rated range is used, with no reserve margin. They're placed only at the end of a route step, so a long highway step can carry the total past the range. The load adjustment changes the cost estimate but not where stops go.
- Vehicle search needs an exact, case-sensitive match on make, model and year.
- The cost step strips non-digits from the Directions API's formatted distance text, so a distance shown with a decimal (for example "45.6 mi") is misread.
- Only Android is fully configured. iOS needs the Maps SDK key step described above.
- `test/widget_test.dart` is still Flutter's default counter test and doesn't exercise the app.
