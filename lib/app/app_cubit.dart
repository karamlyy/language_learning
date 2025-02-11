import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/app/app_state.dart';
import 'package:language_learning/data/endpoint/auth/fcm_token_endpoint.dart';
import 'package:language_learning/data/repository/language_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(Splash()) {
    check();
  }

  final _languageRepository = getIt<UserConfigurationRepository>();

  void passOnboarding() async {
    final prefs = await PreferencesService.instance;
    prefs.setOnBoardingPassed(true);
  }


  Future<void> setFcmToken(String token) async {
    final result = await _languageRepository
        .setFcmToken(FcmTokenInput(token: token, timeZone: 'Asia/Baku'));

    result.fold(
      (error) => print('fcm token did not set'),
      (data) => print('fcm token set successfully'),
    );
  }



  check() async {
    final prefs = await PreferencesService.instance;
    try {
      if (!prefs.wasOnBoardingPassed) {
        emit(Onboarding());
      }

      if (prefs.wasOnBoardingPassed &&
          prefs.wasAuthorizationPassed &&
          prefs.wasTimingPassed &&
          prefs.wasLanguagePassed) {
        setFcmToken(prefs.fcmToken ?? 'test fcm token');
        emit(Authorized());
      }
    } catch (error) {
      prefs.clear();
      emit(Splash());
    }
  }
}
