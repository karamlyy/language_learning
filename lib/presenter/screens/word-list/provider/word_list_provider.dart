import 'package:flutter/material.dart';

import '../../home/model/word.dart';

class WordListProvider extends ChangeNotifier {
  final List<Word> words = [
    Word(id: 0, word: 'Hello', translation: 'Salam'),
    Word(id: 1, word: 'Book', translation: 'Kitab'),
    Word(id: 2, word: 'House', translation: 'Ev'),
    Word(id: 3, word: 'Apple', translation: 'Alma'),
    Word(id: 4, word: 'Horse', translation: 'At'),
    Word(id: 5, word: 'Hi', translation: 'Salam'),
    Word(id: 6, word: 'Table', translation: 'Stol'),
    Word(id: 7, word: 'Sun', translation: 'Günəş'),
    Word(id: 8, word: 'Moon', translation: 'Ay'),
    Word(id: 9, word: 'Star', translation: 'Ulduz'),
    Word(id: 10, word: 'Water', translation: 'Su'),
    Word(id: 11, word: 'Tree', translation: 'Ağac'),
    Word(id: 12, word: 'Flower', translation: 'Çiçək'),
    Word(id: 13, word: 'Dog', translation: 'It'),
    Word(id: 14, word: 'Cat', translation: 'Pişik'),
    Word(id: 15, word: 'Bird', translation: 'Quş'),
    Word(id: 16, word: 'Car', translation: 'Maşın'),
    Word(id: 17, word: 'Plane', translation: 'Təyyarə'),
    Word(id: 18, word: 'Food', translation: 'Yemək'),
    Word(id: 19, word: 'Music', translation: 'Musiqi'),
  ];

  int? _selectedWordId;

  int? get selectedWordId => _selectedWordId;

  void selectWord(int id) {
    _selectedWordId = id;
    notifyListeners();
    print('kliklendi: $id');
  }

  void learnWord(int id) {
    final word = words.firstWhere((word) => word.id == id);
    word.isLearned = !word.isLearned;
    notifyListeners();
    print('$id -idli soz oyrenildi');
  }
}
