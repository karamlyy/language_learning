import 'package:dartz/dartz.dart';
import 'package:language_learning/data/endpoint/quiz/quiz_endpoint.dart';
import 'package:language_learning/data/endpoint/vocabulary/category_vocabulary_endpoint.dart';
import 'package:language_learning/data/endpoint/word/add_master_endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/home/category_word_model.dart';
import 'package:language_learning/data/model/quiz/question_model.dart';
import 'package:language_learning/data/service/api/api.dart';

abstract class QuizRepository {
  Future<Either<HttpException, QuestionModel>> getQuizQuestion(List<int> excludeIds);
  Future<Either<HttpException, void>> addToMaster(int id);

}

class QuizRepositoryImpl extends QuizRepository {
  final ApiService apiService;

  QuizRepositoryImpl(this.apiService);



  @override
  Future<Either<HttpException, QuestionModel>> getQuizQuestion(List<int> excludeIds) async {
    return await apiService.task(QuizEndpoint(excludeIds: excludeIds));
  }

  @override
  Future<Either<HttpException, void>> addToMaster(int id) async {
    return await apiService.task(AddToMasterEndpoint(id: id));
  }
}
