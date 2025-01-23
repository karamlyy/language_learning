import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/app/app_state.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(Splash()) {
    check();
  }

  void passOnboarding() async {
    final prefs = await PreferencesService.instance;
    prefs.setOnBoardingPassed(true);
  }

  check() async {
    final prefs = await PreferencesService.instance;
    try {
      if (prefs.wasOnBoardingPassed == false) {
        emit(Onboarding());
      } else if (prefs.wasConfirmationPassed) {
        emit(Verified());
      } else if (prefs.wasAuthorizationPassed) {
        emit(Authorized());
      } else {
        emit(UnAuthorized());
      }
    } catch (error) {
      prefs.clear();
      emit(Splash());
    }
  }
}
