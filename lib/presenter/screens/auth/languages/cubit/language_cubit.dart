import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/auth/set_language_endpoint.dart';
import 'package:language_learning/data/model/auth/verification_model.dart';
import 'package:language_learning/data/model/base/response_model.dart';
import 'package:language_learning/data/repository/auth_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/presenter/screens/auth/languages/cubit/language_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class SetLanguageCubit extends Cubit<SetLanguageState> {
  SetLanguageCubit(this.verificationModel) : super(SetLanguageInitial());

  final VerificationModel verificationModel;
  final _authRepository = getIt<AuthRepository>();

  void setLanguage(SetLanguageInput input) async {
    emit(SetLanguageLoading());
    final result = await _authRepository.setLanguage(input);
    result.fold(
      (error) => emit(SetLanguageFailure(errorMessage: error.error)),
      (data) {
        Navigation.push(
          Routes.setTiming,
          arguments: verificationModel,
        );
      },
    );
  }
}
