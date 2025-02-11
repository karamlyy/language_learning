import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/auth/fcm_token_endpoint.dart';
import 'package:language_learning/data/endpoint/auth/timing_endpoint.dart';
import 'package:language_learning/data/repository/language_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class TimingCubit extends Cubit<BaseState> {
  TimingCubit() : super(InitialState());

  final _languageRepository = getIt<UserConfigurationRepository>();



  Future<void> setFcmToken(String token) async {
    final result = await _languageRepository
        .setFcmToken(FcmTokenInput(token: token, timeZone: 'Asia/Baku'));

    result.fold(
          (error) => print('fcm token did not set'),
          (data) => print('fcm token set successfully'),
    );
  }

  Future<void> setTiming(TimingInput input) async {
    emit(LoadingState());

    final prefs = await PreferencesService.instance;
    final result = await _languageRepository.setTiming(input);

    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) async {
        prefs.setTimingPassed(true);
        setFcmToken(prefs.fcmToken ?? 'timing test fcm token');
        Navigation.pushNamedAndRemoveUntil(Routes.home);
      },
    );
  }
}
