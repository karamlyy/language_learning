import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/asset-paths/app_assets.dart';
import '../../home/model/word.dart';
import '../../home/model/word_group.dart';

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

  final List<WordGroup> wordGroups = [
    WordGroup(
      id: 0,
      groupName: 'Vegetables',
      icon: SvgPicture.asset(Images.vegetables),
      masteredWords: 3,
      allWords: 25,
    ),
    WordGroup(
      id: 1,
      groupName: 'Fruits',
      icon: SvgPicture.asset(Images.fruits),
      masteredWords: 10,
      allWords: 25,
    ),
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
