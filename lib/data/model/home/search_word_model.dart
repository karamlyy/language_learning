class SearchWordModel {
  int id;
  String? sourceLanguage;
  String? translationLanguage;

  SearchWordModel({
    required this.id,
    this.sourceLanguage,
    this.translationLanguage,
  });

  factory SearchWordModel.fromJson(Map<String, dynamic> json) {
    return SearchWordModel(
      id: json["id"] ?? 0,
      sourceLanguage: json["sourceLanguage"],
      translationLanguage: json["translationLanguage"],
    );
  }
}
