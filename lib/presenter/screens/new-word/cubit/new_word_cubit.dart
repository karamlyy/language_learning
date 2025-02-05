import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/word/new_word_endpoint.dart';
import 'package:language_learning/data/repository/word_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';

class NewWordCubit extends Cubit<BaseState> {
  NewWordCubit() : super(InitialState());

  final _wordRepository = getIt<WordRepository>();

  void addNewWord(NewWordInput input) async {
    emit(LoadingState());
    final result = await _wordRepository.addNewWord(input);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) => emit(SuccessState(data: null)),
    );
  }
}
