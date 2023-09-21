import 'package:bmi_calculator/utils/calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    double bmiValue = bmiCalculation(height, weight);
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
    _showDialog(bmiValue, status);
  }

  void _showDialog(double bmiValue, String status) {
    showCupertinoDialog(
      context: context,
      builder: (builderContext) {
        return CupertinoAlertDialog(
          title: Text("Your Status is: $status"),
          content: Text("Your BMI Score is: ${bmiValue.toStringAsFixed(2)}"),
          actions: [
            CupertinoDialogAction(
              child: const Text("OK"),
              onPressed: () {
                _saveResults(bmiValue, status);
                Navigator.pop(builderContext);
              },
            )
          ],
        );
      },
    );
  }

  void _saveResults(double bmiValue, String status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      "bmi_date",
      DateTime.now().toString(),
    ); // Save the calculation date
    await prefs.setStringList(
      "bmi_data",
      <String>[
        bmiValue.toStringAsFixed(2),
        status,
      ],
    ); // Save the calculation data
  }
}
