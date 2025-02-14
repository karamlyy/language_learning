import 'package:flutter/material.dart';

class WordListProvider extends ChangeNotifier {
  int? _selectedWordId;
  bool _isLearning = false;

  int? get selectedWordId => _selectedWordId;

  bool get isLearning => _isLearning;

  void selectWord(int id) {
    _selectedWordId = id;
    notifyListeners();
    print('kliklendi: $id');
  }

  void addLearning(bool value) {
    _isLearning = value;
    notifyListeners();
  }

  int? get categoryWordInput => selectedWordId;

  bool _isAddedToMaster = false;

  bool get isAddedToMaster => _isAddedToMaster;

  void addToMaster(bool value) {
    _isAddedToMaster = value;
    notifyListeners();
  }
}
