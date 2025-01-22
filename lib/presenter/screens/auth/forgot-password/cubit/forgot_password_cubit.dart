import 'package:bloc/bloc.dart';
import 'package:language_learning/data/endpoint/auth/forgot_password_endpoint.dart';
import 'package:language_learning/data/repository/auth_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/presenter/screens/auth/forgot-password/cubit/forgot_password_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:meta/meta.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  final _authRepository = getIt<AuthRepository>();

  void applyForgotPassword(ForgotPasswordInput input) async {
    emit(ForgotPasswordLoading());
    final result = await _authRepository.applyForgotPassword(input);
    result.fold(
      (error) => emit(ForgotPasswordFailure(errorMessage: error.error)),
      (data) {
        emit(ForgotPasswordSuccess(forgotPasswordModel: data));
        Navigation.push(Routes.resetPassword, arguments: data);
      },
    );
  }
}
