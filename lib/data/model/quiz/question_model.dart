class QuestionModel {
  final int id;
  final String question;
  final Map<String, bool> answers;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      question: json['question'],
      answers: Map<String, bool>.from(json['answers']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answers': answers,
    };
  }
}
