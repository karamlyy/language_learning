class WordPairModel {
  final int id;
  final String source;
  final String translation;
  final bool? isMastered;
  final bool? isLearning;

  WordPairModel({
    required this.id,
    required this.source,
    required this.translation,
    this.isMastered,
    this.isLearning
  });

  factory WordPairModel.fromJson(Map<String, dynamic> json) {
    return WordPairModel(
      id: json['id'] ?? '',
      source: json['source'] ?? '',
      translation: json['translation'] ?? '',
      isMastered: json['isMastered'] ?? false,
      isLearning: json['isLearning'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'source': source,
      'translation': translation,
      'isMastered': isMastered,
      'isLearning': isLearning,
    };
  }
}