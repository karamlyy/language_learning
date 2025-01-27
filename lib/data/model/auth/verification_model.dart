class VerificationModel {
  String? accessToken;
  String? refreshToken;
  String? userId;

  VerificationModel({
    this.accessToken,
    this.refreshToken,
    this.userId,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> json) =>
      VerificationModel(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        userId: json["userId"],
      );
}
