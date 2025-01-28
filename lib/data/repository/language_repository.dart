import 'package:dartz/dartz.dart';
import 'package:language_learning/data/endpoint/auth/get_language_endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/language/language_model.dart';
import 'package:language_learning/data/service/api/api.dart';

abstract class LanguageRepository {
  Future<Either<HttpException, List<LanguageModel>>> getAllLanguages();
}

class LanguageRepositoryImpl extends LanguageRepository {
  final ApiService apiService;

  LanguageRepositoryImpl(this.apiService);

  @override
  Future<Either<HttpException, List<LanguageModel>>> getAllLanguages() async {
    return await apiService.task(GetLanguageEndpoint());
  }
}
