import 'package:flutter/material.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    setUserId();
  }

  String? _userId = '';
  int? _selectedCategoryId;

  String? get userId => _userId;

  void setUserId() async {
    final prefs = await PreferencesService.instance;
    _userId = prefs.userId;
  }

  int? get selectedCategoryId => _selectedCategoryId;
}
