import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CalBrain {
  int height;
  int weight;
  double _bmi;
  CalBrain({this.weight, this.height});

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBodyType() {
    if (_bmi > 25)
      return 'overweight';
    else if (_bmi >= 18)
      return 'Normal';
    else
      return 'UnderWeight';
  }

  String getDesc() {
    if (_bmi > 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  Color getColor() {
    if (_bmi > 25)
      return Colors.red;
    else if (_bmi >= 18)
      return Colors.green;
    else
      return Colors.orangeAccent;
  }
}
