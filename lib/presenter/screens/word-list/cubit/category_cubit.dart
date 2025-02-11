import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/vocabulary/category_word_endpoint.dart';
import 'package:language_learning/data/repository/category_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';

class CategoryCubit extends Cubit<BaseState> {
  CategoryCubit() : super(InitialState()) {
    getCategoryWords();
  }

  final _categoryRepository = getIt<CategoryRepository>();

  void getCategoryWords() async {
    emit(LoadingState());
    final result = await _categoryRepository.getAllCategoryWords(1);
    result.fold(
      (error) => emit(
        FailureState(errorMessage: error.error),
      ),
      (data) {
        emit(SuccessState(data: data));
      },
    );
  }

  void changeWordStatus(int vocabularyId) async {
    emit(LoadingState());
    final result = await _categoryRepository.changeCategoryWordStatus(vocabularyId);

    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        print('status changed');
      },
    );
  }
}
