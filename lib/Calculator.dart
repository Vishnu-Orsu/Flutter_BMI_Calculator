import 'dart:math';

class Calculator {
  Calculator({this.cheight, this.cweight});
  final int cheight;
  final int cweight;
  double _bmi;
  String calculate() {
    _bmi = cweight / pow(cheight / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getRemarks() {
    if (_bmi >= 25) {
      return 'You have higher than normal body weight. Try to exercise more';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have lower than normal body weight. You can a bit more.';
    }
  }
}
