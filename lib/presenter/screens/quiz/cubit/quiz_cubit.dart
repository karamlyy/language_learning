import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/repository/quiz_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';

class QuizCubit extends Cubit<BaseState> {
  QuizCubit() : super(InitialState());

  final _quizRepository = getIt<QuizRepository>();

  void getQuizQuestion(List<int> excludeIds) async {
    emit(LoadingState());
    final result = await _quizRepository
        .getQuizQuestion(excludeIds.isEmpty ? [0] : excludeIds);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        emit(SuccessState(data: data));
      },
    );
  }

  void addToMaster(int id) async {
    emit(LoadingState());
    final result = await _quizRepository.addToMaster(id);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        print('added to master');
      },
    );
  }
}

//when quiz page open make add to master words part invisible, if user click correct answer make visible