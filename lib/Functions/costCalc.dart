import 'package:fuel_wise/Models/CurrentConfig.dart';
import 'package:fuel_wise/Models/selectedcar.dart';

double? costCalc(String distanceString) {
  double mpg = 0.0;
  Map<String, dynamic>? car = SelectedCar.getSelectedCar();

  if (car != null) {
    mpg = car['mpg'];
  }

  print(mpg);
  double extraWeight = 0;
  extraWeight += CurrentConfig.numAdults * 160 +
      CurrentConfig.cargoWeight +
      CurrentConfig.numChildren * 90 +
      CurrentConfig.trailerWeight;

  mpg = mpg * (1 - (0.01 * (extraWeight) / 100));

  String distanceParsed = distanceString.replaceAll(RegExp(r'[^0-9]'), '');
  int distanceInt = int.parse(distanceParsed);

  double result = distanceInt / mpg * 3;
  return double.parse(result.toStringAsFixed(2));
}
