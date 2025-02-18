import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/word/new_word_endpoint.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/repository/word_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class NewWordCubit extends Cubit<BaseState> {
  NewWordCubit() : super(InitialState());

  final _wordRepository = getIt<WordRepository>();
  final _homeRepository = getIt<HomeRepository>();

  void getAllLanguagePairs() async {
    emit(LoadingState());
    final result = await _homeRepository.getAllLanguagePairs();
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        emit(SuccessState(data: data));
      },
    );
  }

  void addNewWord(NewWordInput input) async {
    emit(LoadingState());
    final result = await _wordRepository.addNewWord(input);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (_) {
        Navigation.pushReplacementNamed(Routes.newWord);
      },
    );
  }

}
