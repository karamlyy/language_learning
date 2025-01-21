import 'package:language_learning/data/model/auth/login_model.dart';
import 'package:language_learning/data/model/auth/register_model.dart';

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
