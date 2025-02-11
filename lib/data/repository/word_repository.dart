import 'package:dartz/dartz.dart';
import 'package:language_learning/data/endpoint/word/new_word_endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/service/api/api.dart';

abstract class WordRepository {
  Future<Either<HttpException, void>> addNewWord(NewWordInput input);
}

class WordRepositoryImpl extends WordRepository {
  final ApiService apiService;

  WordRepositoryImpl(this.apiService);

  @override
  Future<Either<HttpException, void>> addNewWord(NewWordInput input) async {
    return await apiService.task<void>(NewWordEndpoint(input));
  }
}
