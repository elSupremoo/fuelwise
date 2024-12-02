class CurrentConfig {
  static int numAdults = 0;
  static int numChildren = 0;
  static double cargoWeight = 0.0;
  static double trailerWeight = 0.0;
  static int numStops = 0;

  static void setNumAdults(int number) {
    numAdults = number;
  }

  static void setNumChildren(int number) {
    numChildren = number;
  }

  static void setCargoWeight(double number) {
    cargoWeight = number;
  }

  static void setTrailerWeight(double number) {
    trailerWeight = number;
  }

  static void setNumStops(int number) {
    numStops = number;
  }
}
