import 'package:dartz/dartz.dart';
import 'package:language_learning/data/endpoint/home/categories_endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/home/category_model.dart';
import 'package:language_learning/data/service/api/api.dart';

abstract class HomeRepository {
  Future<Either<HttpException, List<CategoryModel>>> getAllCategories(String userId);
}

class HomeRepositoryImpl extends HomeRepository {
  final ApiService apiService;

  HomeRepositoryImpl(this.apiService);

  @override
  Future<Either<HttpException, List<CategoryModel>>> getAllCategories(String userId) async {
    return await apiService.task(GetAllCategoriesEndpoint(userId: userId));
  }
}