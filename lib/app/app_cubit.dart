import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/app/app_state.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(Splash()) {
    check();
  }

  check() async {
    final prefs = await PreferencesService.instance;
    try {
      print("Authorization Passed: ${prefs.wasAuthorizationPassed}");

      if (prefs.wasAuthorizationPassed) {
        emit(Authorized());
      } else {
        prefs.clear();
        emit(UnAuthorized());
      }
    } catch (error) {
      print("Error during check: $error");
      prefs.clear();
      emit(Splash());
    }
  }
}
