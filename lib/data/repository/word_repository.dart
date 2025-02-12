import 'package:dartz/dartz.dart';
import 'package:language_learning/data/endpoint/word/add_learning_endpoint.dart';
import 'package:language_learning/data/endpoint/word/new_word_endpoint.dart';
import 'package:language_learning/data/endpoint/word/search_word_endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/home/search_word_model.dart';
import 'package:language_learning/data/model/home/word_pair_model.dart';
import 'package:language_learning/data/service/api/api.dart';

abstract class WordRepository {
  Future<Either<HttpException, void>> addNewWord(NewWordInput input);
  Future<Either<HttpException, void>> addToLearning(int id);
  Future <Either<HttpException, List<WordPairModel>>> searchWord(String searchText);

}

class WordRepositoryImpl extends WordRepository {
  final ApiService apiService;

  WordRepositoryImpl(this.apiService);

  @override
  Future<Either<HttpException, void>> addNewWord(NewWordInput input) async {
    return await apiService.task<void>(NewWordEndpoint(input));
  }

  @override
  Future<Either<HttpException, void>> addToLearning(int id) async {
    return await apiService.task(AddToLearningEndpoint(id: id));
  }

  @override
  Future<Either<HttpException, List<WordPairModel>>> searchWord(String searchText) async {
    return await apiService.task(SearchWordEndpoint(searchText: searchText));
  }
}
