import 'package:dartz/dartz.dart';
import 'package:language_learning/data/endpoint/settings/change_timing_endpoint.dart';
import 'package:language_learning/data/endpoint/settings/get_timing_endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/settings/timing_model.dart';
import 'package:language_learning/data/service/api/api.dart';

abstract class SettingsRepository {
  Future<Either<HttpException, TimingModel>> getTiming();

  Future<Either<HttpException, void>> changeTiming(ChangeTimingInput input);
}

class SettingsRepositoryImpl extends SettingsRepository {
  final ApiService apiService;

  SettingsRepositoryImpl(this.apiService);

  @override
  Future<Either<HttpException, TimingModel>> getTiming() async {
    return await apiService.task(GetTimingEndpoint());
  }

  @override
  Future<Either<HttpException, void>> changeTiming(
      ChangeTimingInput input) async {
    return await apiService.task<void>(ChangeTimingEndpoint(input));
  }
}
