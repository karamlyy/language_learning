import 'package:flutter/material.dart';
import 'package:language_learning/data/endpoint/auth/set_language_endpoint.dart';

class LanguagesProvider extends ChangeNotifier {
  bool isSourceLanguageSelected = false;
  bool isTranslationLanguageSelected = false;

  String _selectedSourceLanguage = '';
  String _selectedTranslationLanguage = '';

  int? _selectedSourceLanguageId;
  int? _selectedTranslationLanguageId;

  int? get selectedSourceLanguageId => _selectedSourceLanguageId;

  int? get selectedTranslationLanguageId => _selectedTranslationLanguageId;

  String get selectedSourceLanguage => _selectedSourceLanguage;

  String get selectedTranslationLanguage => _selectedTranslationLanguage;

  SetLanguageInput get setLanguageInput => SetLanguageInput(
        sourceLanguageId: selectedSourceLanguageId,
        translationLanguageId: selectedTranslationLanguageId,
      );

  void selectSourceLanguageName(String sourceLanguage) {
    _selectedSourceLanguage = sourceLanguage;
    notifyListeners();
  }

  void selectTranslationLanguageName(String translationLanguage) {
    _selectedTranslationLanguage = translationLanguage;
    notifyListeners();
  }

  void selectSourceLanguage(int id) {
    _selectedSourceLanguageId = id;
    isSourceLanguageSelected = true;
    debugPrint(
        '[LanguagesProvider] Selected source language ID: $_selectedSourceLanguageId');
    notifyListeners();
  }

  void selectTranslationLanguage(int id) {
    _selectedTranslationLanguageId = id;
    isTranslationLanguageSelected = true;
    debugPrint(
        '[LanguagesProvider] Selected learning language ID: $_selectedTranslationLanguageId');
    notifyListeners();
  }
}
