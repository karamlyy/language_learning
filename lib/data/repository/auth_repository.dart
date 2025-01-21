import 'package:dartz/dartz.dart';
import 'package:language_learning/data/endpoint/auth/login_endpoint.dart';
import 'package:language_learning/data/endpoint/auth/register_endpoint.dart';
import 'package:language_learning/data/endpoint/auth/verification_endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/auth/login_model.dart';
import 'package:language_learning/data/model/auth/register_model.dart';
import 'package:language_learning/data/service/api/api.dart';

abstract class AuthRepository {
  Future<Either<HttpException, LoginModel>> login(LoginInput input);
  Future<Either<HttpException, RegisterModel>> register(RegisterInput input);
  //Future<Either<HttpException, VerificationModel>> confirmEmail(VerificationInput input);
}

class AuthRepositoryImpl extends AuthRepository {
  final ApiService apiService;

  AuthRepositoryImpl(this.apiService);

  @override
  Future<Either<HttpException, LoginModel>> login(LoginInput input) async {
    return await apiService.task<LoginModel>(LoginEndpoint(input));
  }

  @override
  Future<Either<HttpException, RegisterModel>> register(RegisterInput input) async {
    return await apiService.task<RegisterModel>(RegisterEndpoint(input));
  }




}
