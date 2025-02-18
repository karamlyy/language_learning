import 'dart:developer';

class QuestionModel {
  int? id;
  String? question;
  Map<String, bool>? answers;

  QuestionModel({
    this.id,
    this.question,
    this.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      return QuestionModel();
    }
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
