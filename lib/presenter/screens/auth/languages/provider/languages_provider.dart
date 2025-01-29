import 'package:flutter/material.dart';
import 'package:language_learning/data/endpoint/auth/set_language_endpoint.dart';

class LanguagesProvider extends ChangeNotifier {
  bool isSourceLanguageSelected = false;
  bool isTranslationLanguageSelected = false;

  String _userId = '';
  int? _selectedSourceLanguageId;
  int? _selectedTranslationLanguageId;

  String get userId => _userId;

  int? get selectedSourceLanguageId => _selectedSourceLanguageId;

  int? get selectedTranslationLanguageId => _selectedTranslationLanguageId;

  SetLanguageInput get setLanguageInput => SetLanguageInput(
    userId: _userId,
    sourceLanguageId: selectedSourceLanguageId,
    translationLanguageId: selectedTranslationLanguageId,
  );

  void setUserId(String userId) {
    _userId = userId;
    print('User ID set: $_userId'); // Debug log
    notifyListeners();
  }

  void selectSourceLanguage(int id) {
    _selectedSourceLanguageId = id;
    isSourceLanguageSelected = true;
    print('Selected source language ID: $selectedSourceLanguageId');
    notifyListeners();
  }

  void selectTranslationLanguage(int id) {
    _selectedTranslationLanguageId = id;
    isTranslationLanguageSelected = true;
    print('Selected learning language ID: $selectedTranslationLanguageId');
    notifyListeners();
  }
}
