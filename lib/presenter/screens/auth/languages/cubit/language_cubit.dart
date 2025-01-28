import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/auth/set_language_endpoint.dart';
import 'package:language_learning/data/model/auth/verification_model.dart';
import 'package:language_learning/data/repository/auth_repository.dart';
import 'package:language_learning/data/repository/language_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class LanguageCubit extends Cubit<BaseState> {
  LanguageCubit(this.verificationModel) : super(InitialState());

  final VerificationModel verificationModel;
  final _authRepository = getIt<AuthRepository>();
  final _languageRepository = getIt<LanguageRepository>();

  void getAllLanguages() async {
    emit(LoadingState());
    final result = await _languageRepository.getAllLanguages();
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        emit(SuccessState(data: data));
        print('listin uzunlugu ${data.length}');
      },
    );
  }

  void setLanguage(SetLanguageInput input) async {
    emit(LoadingState());
    final result = await _authRepository.setLanguage(input);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        Navigation.push(
          Routes.setTiming,
        );
      },
    );
  }
}
