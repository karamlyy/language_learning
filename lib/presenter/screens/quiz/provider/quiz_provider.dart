import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  int _chances = 3;

  int get chances => _chances;

  void decrementChance() {
    if (_chances > 0) {
      _chances--;
      notifyListeners();
    }
  }

  void resetChances() {
    _chances = 3;
    notifyListeners();
  }
}