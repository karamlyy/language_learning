import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  int _chances = 3;
  bool _isAddedToMaster = false;
  bool _isCorrectAnswerSelected = false;
  bool _isAnswerSelected = false;
  bool _showAddToMaster = false;


  int get chances => _chances;

  bool get isAddedToMaster => _isAddedToMaster;
  bool get isCorrectAnswerSelected => _isCorrectAnswerSelected;
  bool get isAnswerSelected => _isAnswerSelected;
  bool get showAddToMaster => _showAddToMaster;



  void decrementChance() {
    if (_chances > 0) {
      _chances--;
      notifyListeners();
    }
  }

  void resetChances() {
    _chances = 3;
    _showAddToMaster = false;
    notifyListeners();
  }



  void addToMaster(bool value) {
    _isAddedToMaster = value;
    notifyListeners();
  }

  void setCorrectAnswerSelected(bool value) {
    _showAddToMaster = true;
    notifyListeners();
  }

  bool selectAnswer(bool isSelected) {
    _isAnswerSelected = isSelected;
    notifyListeners();
    return _isAnswerSelected;
  }
}
