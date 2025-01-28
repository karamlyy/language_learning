import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:language_learning/data/endpoint/auth/set_language_endpoint.dart';
import 'package:language_learning/data/model/language/language_model.dart';
import 'package:language_learning/data/repository/language_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

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
    notifyListeners();
  }

  void selectSourceLanguage(int index) {
    _selectedSourceLanguageId = index;
    isSourceLanguageSelected = true;
    print('Selected source language index: $selectedSourceLanguageId');
    notifyListeners();
  }

  void selectTranslationLanguage(int index) {
    _selectedTranslationLanguageId = index;
    isTranslationLanguageSelected = true;
    print('Selected learning language index: $selectedTranslationLanguageId');
    notifyListeners();
  }
}
