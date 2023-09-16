import 'dart:math';

import 'package:flutter/cupertino.dart';

class BmiPageProvider extends ChangeNotifier {
  int age = 25;
  int weight = 50;
  int height = 160;
  String gender = "male";

  void incrementAge() {
    age++;
    notifyListeners();
  }

  void decrementAge() {
    if (age > 1) {
      age--;
      notifyListeners();
    }
  }

  void incrementWeight() {
    weight++;
    notifyListeners();
  }

  void decrementWeight() {
    if (weight > 1) {
      weight--;
      notifyListeners();
    }
  }

  void changeHeight(int newValue) {
    height = newValue;
    notifyListeners();
  }

  void calculateBMI() {
    double heightInMeter = height / 100;
    double result = weight / pow(heightInMeter, 2);
    print(result);
  }
}
