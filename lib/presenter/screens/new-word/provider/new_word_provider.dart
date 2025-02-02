import 'package:flutter/material.dart';
import 'package:language_learning/data/endpoint/word/new_word_endpoint.dart';
import 'package:language_learning/utils/extensions/validation.dart';

class NewWordProvider extends ChangeNotifier {
  bool _isAddedLearning = false;

  String _word = '';
  String _translation = '';

  String? _wordError;
  String? _translationError;

  bool get isAddedLearning => _isAddedLearning;

  String get word => _word;

  String get translation => _translation;

  String? get wordError => _wordError;

  String? get translationError => _translationError;

  NewWordInput get newWordInput => NewWordInput(
        source: _word,
        translation: _translation,
      );

  void updateWord(String word) {
    _word = word;
    if (word.wordAdded()) {
      _wordError = null;
    } else {
      _wordError = 'written word is too short to add';
    }
    notifyListeners();
  }

  void updateTranslation(String translation) {
    _translation = translation;
    if (translation.wordAdded()) {
      _translationError = null;
    } else {
      _translationError = 'written word is too short';
    }
    notifyListeners();
  }

  void addLearning(bool value) {
    _isAddedLearning = value;
    notifyListeners();
  }

  void resetFields() {
    _word = '';
    _translation = '';
    _isAddedLearning = false;
    notifyListeners();
  }

  bool isWordFormValid() {
    return word.wordAdded() && translation.wordAdded();
  }
}
