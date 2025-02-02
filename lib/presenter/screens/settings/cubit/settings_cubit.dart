import 'package:bloc/bloc.dart';
import 'package:language_learning/data/repository/auth_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<BaseState> {
  SettingsCubit() : super(InitialState());

  final _authRepository = getIt<AuthRepository>();

  void deleteUser() async {
    emit(LoadingState());
    final result = await _authRepository.deleteUser();
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) => emit(
        Navigation.push(Routes.login),

      ),
    );
  }
}
