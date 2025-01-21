import 'package:flutter/material.dart';
import 'package:language_learning/utils/extensions/validation.dart';

class NewWordProvider extends ChangeNotifier {
  bool _isAddedLearning = false;

  String _word = '';
  String _translation = '';

  bool get isAddedLearning => _isAddedLearning;

  String get word => _word;

  String get translation => _translation;

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

  void setWord(String value) {
    _word = value;
    print('soz: $_word');
    notifyListeners();
  }

  void setTranslation(String value) {
    _translation = value;
    print('translation soz: $_translation');
    notifyListeners();
  }

  bool isWordFormValid() {
    return word.wordAdded() && translation.wordAdded();
  }
}
