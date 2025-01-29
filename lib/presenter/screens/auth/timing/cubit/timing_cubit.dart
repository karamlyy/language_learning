
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/auth/timing_endpoint.dart';
import 'package:language_learning/data/model/auth/verification_model.dart';
import 'package:language_learning/data/repository/language_repository.dart';
import 'package:language_learning/data/service/api/di.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class TimingCubit extends Cubit<BaseState> {

  final VerificationModel verificationModel;

  TimingCubit(this.verificationModel) : super(InitialState());

  final _languageRepository = getIt<LanguageRepository>();

  void setTiming(TimingInput input) async {
    emit(LoadingState());
    final result = await _languageRepository.setTiming(input);
    result.fold(
      (error) => emit(FailureState(errorMessage: error.error)),
      (data) {
        Navigation.pushNamedAndRemoveUntil(Routes.home, arguments: verificationModel);

      },
    );
  }
}