import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  int _chances = 3;



  bool _isAddedToMaster = false;
  bool _isCorrectAnswerSelected = false;
  bool _isAnswerSelected = false;

  bool get isCorrectAnswerSelected => _isCorrectAnswerSelected;

  int get chances => _chances;

  bool get isAddedToMaster => _isAddedToMaster;

  bool get isAnswerSelected => _isAnswerSelected;

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

  void addToMaster(bool value) {
    _isAddedToMaster = value;
    notifyListeners();
  }

  void setCorrectAnswerSelected(bool value) {
    _isCorrectAnswerSelected = value;
    notifyListeners();
  }

  bool selectAnswer(bool isSelected) {
    _isAnswerSelected = isSelected;
    notifyListeners();
    return _isAnswerSelected;
  }
}
