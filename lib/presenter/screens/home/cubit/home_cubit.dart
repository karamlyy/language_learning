import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/model/home/card_model.dart';
import 'package:language_learning/data/model/home/category_model.dart';
import 'package:language_learning/data/model/home/user_vocabulary_model.dart';
import 'package:language_learning/data/repository/category_repository.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/repository/vocabulary_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:rxdart/rxdart.dart';

class HomeCubit extends Cubit<BaseState> {
  HomeCubit() : super(InitialState()) {
    getAllLanguagePairs();
  }

  final _categoriesController = BehaviorSubject<List<CategoryModel>>();
  final _countController = BehaviorSubject<CardModel>();
  final _lastWordsController = BehaviorSubject<UserVocabularyModel>();

  Stream<List<CategoryModel>> get categoriesController =>
      _categoriesController.stream;

  Stream<CardModel> get countController => _countController.stream;

  Stream<UserVocabularyModel> get lastWordsController =>
      _lastWordsController.stream;

  final _homeRepository = getIt<HomeRepository>();
  final _categoryRepository = getIt<CategoryRepository>();
  final _vocabularyRepository = getIt<VocabularyRepository>();

  Future<void> getAllLanguagePairs() async {
    emit(LoadingState());
    final result = await _homeRepository.getAllLanguagePairs();
    result.fold(
      (error) {
        print('Error: ${error.error}');
        emit(FailureState(errorMessage: error.error));
      },
      (data) {
        print('New data fetched: $data');
        emit(SuccessState(data: data));
      },
    );
  }

  void setSelectedLanguagePair(int id) async {
    final result = await _homeRepository.setSelectedLanguagePair(id);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (_) {
        getAllLanguagePairs();
      },
    );
  }

  void getAllCategories() async {
    final result = await _homeRepository.getAllCategories();
    result.fold(
      (error) => emit(
        FailureState(errorMessage: error.error),
      ),
      (data) {
        _categoriesController.add(data);
      },
    );
  }

  void getCardCounts() async {
    final result = await _homeRepository.getCardCounts();
    result.fold(
      (error) => emit(
        FailureState(errorMessage: error.error),
      ),
      (data) {
        _countController.add(data);
      },
    );
  }

  void getLastWords() async {
    final result = await _homeRepository.getAllWords(1, 20);
    result.fold(
      (error) => emit(
        FailureState(errorMessage: error.error),
      ),
      (data) {
        _lastWordsController.add(data);
      },
    );
  }

  void getCategoryVocabulary(int id) async {
    emit(LoadingState());
    final result = await _categoryRepository.getAllCategoryWords(id);

    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        Navigation.push(Routes.wordList, arguments: data);
      },
    );
  }

  void changeWordStatus(int vocabularyId) async {
    emit(LoadingState());
    final result =
        await _categoryRepository.changeCategoryWordStatus(vocabularyId);

    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {

      },
    );
  }
}
