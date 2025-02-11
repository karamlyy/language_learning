import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/repository/vocabulary_repository.dart';
import 'package:language_learning/data/repository/word_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:rxdart/rxdart.dart';

class VocabularyCubit extends Cubit<BaseState> {
  VocabularyCubit() : super(InitialState()) {
    getAllWords();
  }

  final _isLearningController = BehaviorSubject<void>();

  Stream<void> get isLearningController => _isLearningController.stream;

  final _homeRepository = getIt<HomeRepository>();
  final _vocabularyRepository = getIt<VocabularyRepository>();
  final _wordRepository = getIt<WordRepository>();

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

  /*
  void getAllLearningWords() async {
    emit(LoadingState());
    final result = await _vocabularyRepository.getAllLearningWords(1, 20);
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


   */

  void addToLearning(int id) async {
    final result = await _wordRepository.addToLearning(id);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (_) {
        getAllWords();
      },
    );
  }

   /*

  void addToLearning(int id) async {
    emit(LoadingState());
    final result = await _wordRepository.addToLearning(id);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        print('added to learning');
      },
    );
  }

    */
}
