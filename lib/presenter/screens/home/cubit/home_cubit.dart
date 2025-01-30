import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';

class HomeCubit extends Cubit<BaseState> {
  HomeCubit() : super(InitialState());

  final _homeRepository = getIt<HomeRepository>();

  void getAllCategories(String userId) async {
    emit(LoadingState());
    final result = await _homeRepository.getAllCategories(userId);
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
