import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/repository/word_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';

class VocabularyCubit extends Cubit<BaseState> {
  VocabularyCubit() : super(InitialState()) {
    getAllWords();
  }

  final _wordRepository = getIt<WordRepository>();

  void getAllWords() async {
    emit(LoadingState());
    final result = await _wordRepository.getAllWords(1, 20);
    result.fold(
      (error) => emit(
        FailureState(errorMessage: error.error),
      ),
      (data) {
        emit(SuccessState(data: data));
      },
    );
  }

  void addToLearning(int id) async {
    final result = await _wordRepository.addToLearning(id);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (_) {
        getAllWords();
      },
    );
  }

  void searchWord(String query) async {
    if (query.isEmpty) {
      getAllWords();
      return;
    }

    emit(LoadingState());
    final result = await _wordRepository.searchWord(query, 1, 20);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) => emit(SuccessState(data: data)),
    );
  }
}

/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/model/home/word_pair_model.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/repository/word_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:rxdart/rxdart.dart';

class VocabularyCubit extends Cubit<BaseState> {
  VocabularyCubit() : super(InitialState()) {
    getAllWords();
  }

  final _homeRepository = getIt<HomeRepository>();
  final _wordRepository = getIt<WordRepository>();

  final _searchController = BehaviorSubject<List<WordPairModel>>();

  Stream<List<WordPairModel>> get searchController => _searchController.stream;

  final _addingController = BehaviorSubject<void>();

  Stream<void> get addingController => _addingController.stream;

  void getAllWords() async {
    emit(LoadingState());
    final result = await _homeRepository.getAllWords(1, 20);
    result.fold(
      (error) => emit(
        FailureState(errorMessage: error.error),
      ),
      (data) {
        emit(
          SuccessState(data: data),
        );
      },
    );
  }

  void addToLearning(int id) async {
    final result = await _wordRepository.addToLearning(id);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        _addingController.add(data);
      },
    );
  }

  void searchWord(String query) async {
    if (query.isEmpty) {
      getAllWords();
      return;
    }

    final result = await _wordRepository.searchWord(query);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) => _searchController.add(data),
    );
  }
}

 */
