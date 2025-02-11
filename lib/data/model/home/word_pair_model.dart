class WordPairModel {
  final int id;
  final String source;
  final String translation;

  WordPairModel({
    required this.id,
    required this.source,
    required this.translation,
  });

  factory WordPairModel.fromJson(Map<String, dynamic> json) {
    return WordPairModel(
      id: json['id'] ?? '',
      source: json['source'] ?? '',
      translation: json['translation'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'source': source,
      'translation': translation,
    };
  }
}