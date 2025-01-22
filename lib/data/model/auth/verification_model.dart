class VerificationModel {
  String? accessToken;
  String? refreshToken;



  VerificationModel({
    this.accessToken,
    this.refreshToken,
  });

  factory VerificationModel.fromJson(Map<String, dynamic> json) => VerificationModel(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
  );
}
