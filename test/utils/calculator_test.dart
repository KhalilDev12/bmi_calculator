import 'package:bmi_calculator/utils/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "Give Height and Weight When calculateBMI invoked then correct BMI returned",
    () {
      // Arrange
      const int height = 160, weight = 50;
      // Act
      double bmi = bmiCalculation(height, weight);
      // Assert
      expect(bmi, 19.531249999999996);
    },
  );
}
