class SelectedCar {
  static Map<String, dynamic>? currentCar;

  static void setSelectedCar(Map<String, dynamic> car) {
    currentCar = car;
  }

  static Map<String, dynamic>? getSelectedCar() {
    return currentCar;
  }
}
