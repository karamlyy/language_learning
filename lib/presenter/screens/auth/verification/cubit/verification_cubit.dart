import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/auth/verification_endpoint.dart';
import 'package:language_learning/data/repository/auth_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/presenter/screens/auth/verification/cubit/verification_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());

  final _authRepository = getIt<AuthRepository>();

  void confirmEmail(VerificationInput input) async {
    emit(VerificationInitial());
    final result = await _authRepository.confirmEmail(input);
    result.fold((error) => emit(VerificationFailure(errorMessage: error.error)),
        (message) {
          emit(VerificationSuccess(responseModel: message));
          Navigation.push(Routes.setLanguage);
        });
  }
}
