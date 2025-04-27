import 'package:flutter/material.dart';

class ProgressProvider with ChangeNotifier {
  int _totalTime = 0;
  double _totalCalories = 0;

  int get totalTime => _totalTime;
  double get totalCalories => _totalCalories;

  void setProgress(int time, double calories) {
    _totalTime = time;
    _totalCalories = calories;
    notifyListeners();
  }

  void reset() {
    _totalTime = 0;
    _totalCalories = 0;
    notifyListeners();
  }
} 