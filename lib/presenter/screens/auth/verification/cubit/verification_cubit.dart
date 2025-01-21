import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/repository/auth_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/presenter/screens/auth/verification/cubit/verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationInitial());

  final _authRepository = getIt<AuthRepository>();

  void confirmEmail() {}
}
