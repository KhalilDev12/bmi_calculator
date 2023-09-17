import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiPageProvider extends ChangeNotifier {
  int age = 25;
  int weight = 50;
  int height = 160;
  String gender = "male";
  late BuildContext context;

  BmiPageProvider(this.context);

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
    double bmiValue = weight / pow(heightInMeter, 2);
    String status = "";
    if (bmiValue < 18.5) {
      status = "Underweight";
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      status = "Normal";
    } else if (bmiValue >= 25 && bmiValue < 30) {
      status = "Overweight";
    } else if (bmiValue >= 30) {
      status = "Obese";
    }
    showCupertinoDialog(
      context: context,
      builder: (builderContext) {
        return _dialog(bmiValue, status, builderContext);
      },
    );
  }

  Widget _dialog(double bmiValue, String status, BuildContext builderContext) {
    return CupertinoAlertDialog(
      title: Text("Your Status is: $status"),
      content: Text("Your BMI Score is: ${bmiValue.toStringAsFixed(2)}"),
      actions: [
        CupertinoDialogAction(
          child: const Text("OK"),
          onPressed: () {
            Navigator.pop(builderContext);
          },
        )
      ],
    );
  }
}
