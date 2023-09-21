import 'dart:math';

double bmiCalculation(int height, int weight) {
  double heightInMeter = height / 100;

  return (weight / pow(heightInMeter, 2));
}
