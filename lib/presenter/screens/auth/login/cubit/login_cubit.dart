import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/auth/fcm_token_endpoint.dart';
import 'package:language_learning/data/endpoint/auth/login_endpoint.dart';
import 'package:language_learning/data/repository/auth_repository.dart';
import 'package:language_learning/data/repository/language_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class LoginCubit extends Cubit<BaseState> {
  LoginCubit() : super(InitialState());

  final _authRepository = getIt<AuthRepository>();
  final _languageRepository = getIt<UserConfigurationRepository>();

  void login(LoginInput input) async {
    emit(LoadingState());
    final result = await _authRepository.login(input);
    final prefs = await PreferencesService.instance;
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) async {
        prefs.setOnBoardingPassed(true);
        prefs.setAccessToken(data.accessToken ?? "");
        prefs.setRefreshToken(data.refreshToken ?? "");
        prefs.setAuthorizationPassed(true);
        prefs.setLanguagePassed(true);
        prefs.setTimingPassed(true);

        await setFcmToken();

        emit(SuccessState(data: data));
        Navigation.pushNamedAndRemoveUntil(Routes.home);
      },
    );
  }

  Future<void> setFcmToken() async {
    final prefs = await PreferencesService.instance;
    final fcmToken = prefs.fcmToken;

    if (fcmToken != null) {
      final result = await _languageRepository
          .setFcmToken(FcmTokenInput(token: fcmToken, timeZone: 'Asia/Baku'));

      result.fold(
        (error) => print('FCM token failed to set'),
        (data) => print('FCM token set successfully'),
      );
    }
  }
}
