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

  /// Set the user ID
  void setUserId(String userId) {
    _userId = userId;
    debugPrint('[LanguagesProvider] User ID set: $_userId');
    notifyListeners();
  }

  /// Select source (native) language
  void selectSourceLanguage(int id) {
    _selectedSourceLanguageId = id;
    isSourceLanguageSelected = true;
    debugPrint('[LanguagesProvider] Selected source language ID: $_selectedSourceLanguageId');
    notifyListeners();
  }

  /// Select translation (learning) language
  void selectTranslationLanguage(int id) {
    _selectedTranslationLanguageId = id;
    isTranslationLanguageSelected = true;
    debugPrint('[LanguagesProvider] Selected learning language ID: $_selectedTranslationLanguageId');
    notifyListeners();
  }

  /// Reset only the source language selection
  void resetSourceLanguage() {
    _selectedSourceLanguageId = null;
    isSourceLanguageSelected = false;
    debugPrint('[LanguagesProvider] Reset source language selection.');
    notifyListeners();
  }

  /// Reset only the translation language selection
  void resetTranslationLanguage() {
    _selectedTranslationLanguageId = null;
    isTranslationLanguageSelected = false;
    debugPrint('[LanguagesProvider] Reset translation language selection.');
    notifyListeners();
  }

  /// Reset both language selections
  void resetLanguages() {
    _selectedSourceLanguageId = null;
    _selectedTranslationLanguageId = null;
    isSourceLanguageSelected = false;
    isTranslationLanguageSelected = false;
    debugPrint('[LanguagesProvider] Reset all language selections.');
    notifyListeners();
  }
}
