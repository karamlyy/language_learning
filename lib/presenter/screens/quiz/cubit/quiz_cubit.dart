import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/repository/quiz_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/quiz/provider/quiz_provider.dart';

class QuizCubit extends Cubit<BaseState> {
  QuizCubit() : super(InitialState());

  final _quizRepository = getIt<QuizRepository>();
  final List<int> _askedQuestionIds = [];

  void getQuizQuestion() async {
    emit(LoadingState());
    final result = await _quizRepository.getQuizQuestion(
      _askedQuestionIds.isEmpty ? [0] : _askedQuestionIds,
    );
    result.fold(
          (error) => emit(FailureState(errorMessage: error.error)),
          (data) {
        if (data == null) {
          emit(SuccessState(data: null));
        } else {
          _askedQuestionIds.add(data.id ?? 0);
          emit(SuccessState(data: data));
        }
      },
    );
  }

  void addToMaster(int id, QuizProvider quizProvider) async {
    final result = await _quizRepository.addToMaster(id);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        quizProvider.addToMaster(true);
      },
    );
  }

  List<int> get askedQuestionIds => _askedQuestionIds;
}
