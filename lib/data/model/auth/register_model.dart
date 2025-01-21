class RegisterModel {
  String? userId;
  DateTime? codeExpiry;



  RegisterModel({
    this.userId,
    this.codeExpiry,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    userId: json["userId"],
    codeExpiry: json["codeExpiry"],
  );
}
