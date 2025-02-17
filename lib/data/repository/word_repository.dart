import 'package:dartz/dartz.dart';
import 'package:language_learning/data/endpoint/home/user_vocabulary_endpoint.dart';
import 'package:language_learning/data/endpoint/word/add_learning_endpoint.dart';
import 'package:language_learning/data/endpoint/word/add_master_endpoint.dart';
import 'package:language_learning/data/endpoint/word/delete_word_endpoint.dart';
import 'package:language_learning/data/endpoint/word/new_word_endpoint.dart';
import 'package:language_learning/data/endpoint/word/search_word_endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/home/user_vocabulary_model.dart';
import 'package:language_learning/data/service/api/api.dart';

abstract class WordRepository {
  Future<Either<HttpException, void>> addNewWord(NewWordInput input);

  Future<Either<HttpException, void>> addToLearning(int id);
  Future<Either<HttpException, void>> removeFromMastered(int id);
  Future<Either<HttpException, void>> deleteWord(int id);



  Future<Either<HttpException, UserVocabularyModel>> getAllWords(
      int page, int pageSize);

  Future<Either<HttpException, UserVocabularyModel>> searchWord(
      String searchText, int page, int pageSize);
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
  Future<Either<HttpException, void>> removeFromMastered(int id) async {
    return await apiService.task(AddToMasterEndpoint(id: id));
  }

  @override
  Future<Either<HttpException, UserVocabularyModel>> getAllWords(
      int page, int pageSize) async {
    return await apiService
        .task(GetAllWordsEndpoint(page: page, pageSize: pageSize));
  }

  @override
  Future<Either<HttpException, void>> deleteWord(int id) async {
    return await apiService.task(DeleteWordEndpoint(id: id));
  }


  @override
  Future<Either<HttpException, UserVocabularyModel>> searchWord(
      String searchText, int page, int pageSize) async {
    return await apiService.task(SearchWordEndpoint(
        searchText: searchText, page: page, pageSize: pageSize));
  }
}
