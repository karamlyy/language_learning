import 'dart:async';
import 'package:flutter/material.dart';

class VocabularyProvider extends ChangeNotifier {
  bool _isSearchActive = false;
  final TextEditingController searchController = TextEditingController();
  Timer? _debounceTimer;


  bool get isSearchActive => _isSearchActive;

  void toggleSearch() {
    _isSearchActive = !_isSearchActive;
    if (!_isSearchActive) {
      searchController.clear();
    }
    notifyListeners();
  }

  bool _isAdded = false;

  bool get isAdded => _isAdded;


  void changeWordStatus(bool value) {
    _isAdded = value;
    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();
    notifyListeners();
  }

  void onSearchChanged(String query, Function(String) onSearch) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      onSearch(query);
    });
  }


}
