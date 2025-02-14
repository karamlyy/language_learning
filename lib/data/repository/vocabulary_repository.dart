import 'package:dartz/dartz.dart';
import 'package:language_learning/data/endpoint/home/user_vocabulary_leaning_endpoint.dart';
import 'package:language_learning/data/endpoint/home/user_vocabulary_mastered_endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/home/user_vocabulary_model.dart';
import 'package:language_learning/data/service/api/api.dart';

abstract class VocabularyRepository {
  Future<Either<HttpException, UserVocabularyModel>> getAllLearningWords(
      int page, int pageSize);

  Future<Either<HttpException, UserVocabularyModel>> getAllMasterWords(
      int page, int pageSize);
}

class VocabularyRepositoryImpl extends VocabularyRepository {
  final ApiService apiService;

  VocabularyRepositoryImpl(this.apiService);

  @override
  Future<Either<HttpException, UserVocabularyModel>> getAllLearningWords(
      int page, int pageSize) async {
    return await apiService
        .task(GetAllLearningWordsEndpoint(page: page, pageSize: pageSize));
  }

  @override
  Future<Either<HttpException, UserVocabularyModel>> getAllMasterWords(
      int page, int pageSize) async {
    return await apiService
        .task(GetAllMasteredWordsEndpoint(page: page, pageSize: pageSize));
  }
}
