import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';

class HomeCubit extends Cubit<BaseState> {
  HomeCubit() : super(InitialState());

  final _homeRepository = getIt<HomeRepository>();

  void getAllWords(int page, int pageSize) async {
    emit(LoadingState());
    final result = await _homeRepository.getAllWords(page, pageSize);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        emit(
          SuccessState(data: data),
        );
      },
    );
  }

  void getAllCategories() async {
    emit(LoadingState());
    final result = await _homeRepository.getAllCategories();
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        emit(
          SuccessState(data: data),
        );
      },
    );
  }
}
