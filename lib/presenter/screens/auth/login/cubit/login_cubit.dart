import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/auth/login_endpoint.dart';
import 'package:language_learning/data/repository/auth_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/auth/login/cubit/login_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class LoginCubit extends Cubit<BaseState> {
  LoginCubit() : super(InitialState());

  final _authRepository = getIt<AuthRepository>();

  void login(LoginInput input) async {
    emit(LoadingState());
    final result = await _authRepository.login(input);
    final prefs = await PreferencesService.instance;
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        prefs.setAccessToken(data.accessToken ?? "");
        prefs.setRefreshToken(data.refreshToken ?? "");
        prefs.setAuthorizationPassed(true);
        prefs.setOnBoardingPassed(true);
        emit(SuccessState(data: data));
        Navigation.pushNamedAndRemoveUntil(Routes.home);
      },
    );
  }
}
