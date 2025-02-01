import 'package:language_learning/data/model/auth/forgot_password_model.dart';
import 'package:language_learning/data/model/auth/login_model.dart';
import 'package:language_learning/data/model/auth/register_model.dart';
import 'package:language_learning/data/model/auth/verification_model.dart';
import 'package:language_learning/data/model/home/category_model.dart';
import 'package:language_learning/data/model/home/language_pair_model.dart';
import 'package:language_learning/data/model/home/user_vocabulary_model.dart';
import 'package:language_learning/data/model/language/language_model.dart';

class ResponseModel<T> {
  int status;
  String? message;
  T? data;
  List<dynamic>? errors;

  ResponseModel({
    this.message,
    this.data,
    this.errors,
    required this.status,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    T? getData(Map<String, dynamic>? data) {
      if (data == null) return null;
      switch (T) {
        case const (String):
          return data["data"] as T;

        case const (LoginModel):
          return LoginModel.fromJson(data) as T;
        case const (RegisterModel):
          return RegisterModel.fromJson(data) as T;
        case const (VerificationModel):
          return VerificationModel.fromJson(data) as T;
        case const (ForgotPasswordModel):
          return ForgotPasswordModel.fromJson(data) as T;
        case const (ResponseModel):
          return ResponseModel.fromJson(data) as T;
        case const (List<LanguageModel>):
          return (data["data"] as List)
              .map((e) => LanguageModel.fromJson(e))
              .toList() as T;
        case const (List<CategoryModel>):
          return (data["data"] as List)
              .map((e) => CategoryModel.fromJson(e))
              .toList() as T;
        case const (List<LanguagePairModel>):
          return (data["data"] as List)
              .map((e) => LanguagePairModel.fromJson(e))
              .toList() as T;
        case const (UserVocabularyModel):
          return UserVocabularyModel.fromJson(data) as T;


      }
      return data["data"];
    }

    return ResponseModel(
      status: json["statusCode"] ?? 200,
      message: json["message"] ?? "",
      errors: json["errors"] ?? [],
      data: json["data"] == null
          ? getData(json)
          : getData(
              (json["data"].runtimeType == List ||
                      json["data"].runtimeType == int)
                  ? json
                  : json["data"],
            ),
    );
  }

  bool get isSuccessful {
    return [200, 201, 203, 204].contains(status);
  }

  bool get hasData {
    return data != null;
  }
}
