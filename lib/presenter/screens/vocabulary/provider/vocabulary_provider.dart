import 'package:flutter/material.dart';

class VocabularyProvider extends ChangeNotifier {
  bool _isSearchActive = false;

  bool get isSearchActive => _isSearchActive;

  void toggleSearch() {
    _isSearchActive = !_isSearchActive;
    notifyListeners();
  }

  int? _selectedWordId;

  int? get selectedWordId => _selectedWordId;

  void selectWord(int id) {
    _selectedWordId = id;
    notifyListeners();
  }
}
