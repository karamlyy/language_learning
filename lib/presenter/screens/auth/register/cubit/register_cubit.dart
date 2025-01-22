import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/auth/register_endpoint.dart';
import 'package:language_learning/data/repository/auth_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';
import 'package:language_learning/presenter/screens/auth/register/cubit/register_state.dart';
import 'package:language_learning/presenter/screens/auth/verification/view/verification_page.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final _authRepository = getIt<AuthRepository>();

  void register(RegisterInput input) async {
    emit(RegisterLoading());
    final result = await _authRepository.register(input);
    final prefs = await PreferencesService.instance;
    result.fold(
      (error) => emit(RegisterFailure(errorMessage: error.error)),
      (data) {

        prefs.setUserId(data.userId ?? "");
        emit(RegisterSuccess(registerModel: data));
        Navigation.pushNamedAndRemoveUntil(Routes.verification, arguments: data);
        print('successful data:  ${data.userId} ${data.codeExpiry}');
      },
    );
  }
}
