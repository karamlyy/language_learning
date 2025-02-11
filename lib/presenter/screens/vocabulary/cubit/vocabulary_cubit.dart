import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/repository/vocabulary_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';

class VocabularyCubit extends Cubit<BaseState> {
  VocabularyCubit() : super(InitialState());

  final _homeRepository = getIt<HomeRepository>();
  final _vocabularyRepository = getIt<VocabularyRepository>();

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
}
