class LanguagePairModel {
  int id;
  String sourceLanguage;
  String translationLanguage;
  bool isSelected;

  LanguagePairModel({
    required this.id,
    required this.sourceLanguage,
    required this.translationLanguage,
    required this.isSelected,
  });

  factory LanguagePairModel.fromJson(Map<String, dynamic> json) {
    return LanguagePairModel(
      id: json["id"],
      sourceLanguage: json["sourceLanguage"],
      translationLanguage: json["translationLanguage"],
      isSelected: json["isSelected"],
    );
  }
}
