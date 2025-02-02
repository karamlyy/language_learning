// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:language_learning/data/repository/home_repository.dart';
// import 'package:language_learning/data/service/api/di.dart';
// import 'package:language_learning/generic/base_state.dart';
//
// class HomeCubit extends Cubit<BaseState> {
//   HomeCubit() : super(InitialState());
//
//   final _homeRepository = getIt<HomeRepository>();
//
//   void getAllWords(int page, int pageSize) async {
//     emit(LoadingState());
//     final result = await _homeRepository.getAllWords(page, pageSize);
//     result.fold(
//       (error) => emit(FailureState(errorMessage: error.error)),
//       (data) {
//         emit(
//           SuccessState(data: data),
//         );
//       },
//     );
//   }
//
//   void getAllCategories() async {
//     emit(LoadingState());
//     final result = await _homeRepository.getAllCategories();
//     result.fold(
//       (error) => emit(
//         FailureState(errorMessage: error.error),
//       ),
//       (data) {
//         emit(
//           SuccessState(data: data),
//         );
//       },
//     );
//   }
//
//   void getAllLanguagePairs() async {
//     emit(LoadingState());
//     final result = await _homeRepository.getAllLanguagePairs();
//     result.fold(
//       (error) => emit(
//         FailureState(errorMessage: error.error),
//       ),
//       (data) {
//         emit(SuccessState(data: data));
//       },
//     );
//   }
//
//
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/home/category_model.dart';
import 'package:language_learning/data/model/home/user_vocabulary_model.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';

class HomeCubit extends Cubit<BaseState> {
  HomeCubit() : super(InitialState());

  final _homeRepository = getIt<HomeRepository>();

  List<CategoryModel> categories = [];
  UserVocabularyModel? words;

  void loadHomeData() async {
    emit(LoadingState());

    final categoryResult = await _homeRepository.getAllCategories();
    final wordResult = await _homeRepository.getAllWords(1, 20);

    categoryResult.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) => categories = data,
    );

    wordResult.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) => words = data,
    );

    if (categories.isNotEmpty && words != null) {
      emit(SuccessState(data: {"categories": categories, "words": words}));
    } else {
      emit(
        FailureState(
          errorMessage: ErrorMessage(message: 'Failed to fetch data'),
        ),
      );
    }
  }
}
