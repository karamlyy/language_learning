import 'package:flutter/material.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';


class LanguagesProvider extends ChangeNotifier {
  bool isNativeLanguageSelected = false;
  bool isLearningLanguageSelected = false;

  int? selectedNativeLanguageIndex;
  int? selectedLearningLanguageIndex;
  int pageIndex = 0;
  final PageController pageController = PageController();

  final List<Map<String, String>> languages = [
    {'name': 'Italian', 'flag': 'assets/images/flags/italian.png'},
    {'name': 'Spain', 'flag': 'assets/images/flags/spanish.png'},
    {'name': 'Russian', 'flag': 'assets/images/flags/russian.png'},
  ];

  void selectNativeLanguage(int index) {
    selectedNativeLanguageIndex = index;
    isNativeLanguageSelected = true;
    print('Selected native language index: $selectedNativeLanguageIndex');
    notifyListeners();
  }

  void selectLearningLanguage(int index) {
    selectedLearningLanguageIndex = index;
    isLearningLanguageSelected = true;
    print('Selected learning language index: $selectedLearningLanguageIndex');
    notifyListeners();
  }

  void goToNextPage(int pageIndex) {
    this.pageIndex = pageIndex;
    if (pageIndex == 0) {
      pageController.jumpToPage(1);
    } else {
      Navigation.pushReplacementNamed(Routes.setTiming);
    }
    notifyListeners();
  }

  void goToPreviousPage(int pageIndex) {
    this.pageIndex = pageIndex;
    if (pageIndex == 1) {
      pageController.jumpToPage(0);
    } else {
      Navigation.push(Routes.login);
    }
    notifyListeners();
  }
}
