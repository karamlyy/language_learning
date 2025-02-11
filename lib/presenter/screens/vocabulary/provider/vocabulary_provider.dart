import 'package:flutter/material.dart';

class VocabularyProvider extends ChangeNotifier {
  bool _isSearchActive = false;
  List<int> _bookmarkedWordIds = [];

  bool get isSearchActive => _isSearchActive;
  List<int> get bookmarkedWordIds => _bookmarkedWordIds;

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

  void toggleBookmark(int id) {
    if (_bookmarkedWordIds.contains(id)) {
      _bookmarkedWordIds.remove(id);
    } else {
      _bookmarkedWordIds.add(id);
    }
    notifyListeners();
  }
}