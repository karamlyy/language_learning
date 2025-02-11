import 'package:flutter/material.dart';
import 'package:language_learning/data/endpoint/vocabulary/category_word_endpoint.dart';
import 'package:language_learning/presenter/screens/home/model/word.dart';

class WordListProvider extends ChangeNotifier {
  int? _selectedWordId;
  bool _isLearning = false;

  int? get selectedWordId => _selectedWordId;

  bool get isLearning => _isLearning;

  void selectWord(int id) {
    _selectedWordId = id;
    notifyListeners();
    print('kliklendi: $id');
  }

  void addLearning(bool value) {
    _isLearning = value;
    notifyListeners();
  }

  int? get categoryWordInput => selectedWordId;


}
