import 'package:dartz/dartz.dart';
import 'package:language_learning/data/endpoint/auth/forgot_password_endpoint.dart';
import 'package:language_learning/data/endpoint/auth/login_endpoint.dart';
import 'package:language_learning/data/endpoint/auth/register_endpoint.dart';
import 'package:language_learning/data/endpoint/auth/reset_password_endpoint.dart';
import 'package:language_learning/data/endpoint/auth/verification_endpoint.dart';
import 'package:language_learning/data/endpoint/auth/verify_code_endpoint.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/data/model/auth/forgot_password_model.dart';
import 'package:language_learning/data/model/auth/login_model.dart';
import 'package:language_learning/data/model/auth/register_model.dart';
import 'package:language_learning/data/model/auth/verification_model.dart';
import 'package:language_learning/data/service/api/api.dart';

abstract class AuthRepository {
  Future<Either<HttpException, LoginModel>> login(LoginInput input);

  Future<Either<HttpException, RegisterModel>> register(RegisterInput input);

  Future<Either<HttpException, VerificationModel>> confirmEmail(
      VerificationInput input);

  Future<Either<HttpException, void>> resendConfirmationEmail(String userId);

  Future<Either<HttpException, ForgotPasswordModel>> applyForgotPassword(
      ForgotPasswordInput input);

  Future<Either<HttpException, void>> verifyCode(VerifyCodeInput input);

  Future<Either<HttpException, void>> resetPassword(ResetPasswordInput input);
}

class AuthRepositoryImpl extends AuthRepository {
  final ApiService apiService;

  AuthRepositoryImpl(this.apiService);

  @override
  Future<Either<HttpException, LoginModel>> login(LoginInput input) async {
    return await apiService.task<LoginModel>(LoginEndpoint(input));
  }

  @override
  Future<Either<HttpException, RegisterModel>> register(
      RegisterInput input) async {
    return await apiService.task<RegisterModel>(RegisterEndpoint(input));
  }

  @override
  Future<Either<HttpException, VerificationModel>> confirmEmail(
      VerificationInput input) async {
    return await apiService
        .task<VerificationModel>(VerificationEndpoint(input));
  }

  @override
  Future<Either<HttpException, void>> resendConfirmationEmail(
      String userId) async {
    return await apiService.task<void>(ResendConfirmationEmail(userId));
  }

  @override
  Future<Either<HttpException, ForgotPasswordModel>> applyForgotPassword(
      ForgotPasswordInput input) async {
    return await apiService
        .task<ForgotPasswordModel>(ForgotPasswordEndpoint(input));
  }

  @override
  Future<Either<HttpException, void>> verifyCode(VerifyCodeInput input) async {
    return await apiService.task<void>(VerifyCodeEndpoint(input));
  }

  @override
  Future<Either<HttpException, void>> resetPassword(ResetPasswordInput input) async {
    return await apiService.task<void>(ResetPasswordEndpoint(input));
  }
}
