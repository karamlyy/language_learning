class LoginModel {
  String? accessToken;
  String? refreshToken;
  bool? hasLanguage;

  LoginModel({
    this.accessToken,
    this.refreshToken,
    this.hasLanguage,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        hasLanguage: json["hasLanguage"],
      );
}
