import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/model/auth/login_model.dart';
import 'package:language_learning/data/repository/home_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';

class HomeCubit extends Cubit<BaseState> {
  HomeCubit(this.loginModel) : super(InitialState());

  final LoginModel loginModel;
  final _homeRepository = getIt<HomeRepository>();

  void getAllCategories() async {
    emit(LoadingState());
    final result = await _homeRepository.getAllCategories();
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        emit(SuccessState(data: data));
      },
    );
  }
}
