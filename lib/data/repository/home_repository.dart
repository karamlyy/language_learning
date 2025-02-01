import 'package:dartz/dartz.dart';
import 'package:language_learning/data/endpoint/home/categories_endpoint.dart';
import 'package:language_learning/data/endpoint/home/user_language_pair_endpoint.dart';
import 'package:language_learning/data/endpoint/home/user_vocabulary_endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/home/category_model.dart';
import 'package:language_learning/data/model/home/language_pair_model.dart';
import 'package:language_learning/data/model/home/user_vocabulary_model.dart';
import 'package:language_learning/data/service/api/api.dart';

abstract class HomeRepository {
  Future<Either<HttpException, List<CategoryModel>>> getAllCategories();
  Future<Either<HttpException, List<LanguagePairModel>>> getAllLanguagePairs();
  Future<Either<HttpException, UserVocabularyModel>> getAllWords(int page, int pageSize);

}

class HomeRepositoryImpl extends HomeRepository {
  final ApiService apiService;

  HomeRepositoryImpl(this.apiService);

  @override
  Future<Either<HttpException, List<CategoryModel>>> getAllCategories() async {
    return await apiService.task(GetAllCategoriesEndpoint());
  }

  @override
  Future<Either<HttpException, UserVocabularyModel>> getAllWords(int page, int pageSize) async {
    return await apiService.task(GetAllWordsEndpoint(page: page, pageSize: pageSize));
  }

  @override
  Future<Either<HttpException, List<LanguagePairModel>>> getAllLanguagePairs() async {
    return await apiService.task(GetAllLanguagePairsEndpoint());
  }
}
