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
}
