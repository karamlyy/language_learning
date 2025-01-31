import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/home/widgets/list_card.dart';

class HomeProvider extends ChangeNotifier {
  int? _selectedCategoryId;
  int _selectedListId = 1;

  bool _isListActive = false;

  int? get selectedCategoryId => _selectedCategoryId;
  int get selectedListId => _selectedListId;

  bool get isListActive => _isListActive;

  final List<ListCard> lists = [
    ListCard(
      id: 0,
      listName: 'Learning now',
      isActive: false,
      onTap: () {},
    ),
    ListCard(
      id: 1,
      listName: 'Vocabulary',
      isActive: false,
      onTap: () {},
    ),
    ListCard(
      id: 2,
      listName: 'Mastered words',
      isActive: false,
      onTap: () {},
    )
  ];


  void setListActive(bool value) {
    _isListActive = value;
    notifyListeners();
  }

  void setSelectedList(int id) {
    _selectedListId = id;
    notifyListeners();
    print('selected list id: $_selectedListId');
  }
}
