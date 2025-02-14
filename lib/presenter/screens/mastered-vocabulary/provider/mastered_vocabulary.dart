import 'package:flutter/material.dart';

class MasteredVocabularyProvider extends ChangeNotifier {
  bool _isAdded = false;

  bool get isAdded => _isAdded;

  void changeWordStatus(bool value) {
    _isAdded = value;
    notifyListeners();
  }
}
