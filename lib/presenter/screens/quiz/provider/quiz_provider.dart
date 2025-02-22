import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  int _chances = 3;
  int _correctAnswerCount = 0;
  bool _isAddedToMaster = false;
  bool _isCorrectAnswerSelected = false;
  bool _isAnswerSelected = false;
  bool _showAddToMaster = false;
  String? _selectedAnswer;
  bool? _selectedAnswerCorrect;
  bool _isAnswerLocked = false;
  String? _correctAnswer;
  bool _isAnswersUnblurred = false;

  bool get isAnswersUnblurred => _isAnswersUnblurred;


  bool get isCorrectAnswerSelected => _isCorrectAnswerSelected;
  int get chances => _chances;
  int get correctAnswerCount => _correctAnswerCount;
  bool get isAddedToMaster => _isAddedToMaster;
  bool get isAnswerSelected => _isAnswerSelected;
  bool get showAddToMaster => _showAddToMaster;
  String? get selectedAnswer => _selectedAnswer;
  bool? get selectedAnswerCorrect => _selectedAnswerCorrect;
  bool get isAnswerLocked => _isAnswerLocked;
  String? get correctAnswer => _correctAnswer;

  void decrementChance() {
    if (_chances > 0) {
      _chances--;
      debugPrint('Chance decremented. Remaining: $_chances');
      notifyListeners();
    }
  }

  void unblurAnswers() {
    _isAnswersUnblurred = true;
    notifyListeners();
  }

  void blurAnswers() {
    _isAnswersUnblurred = false;
    notifyListeners();
  }

  void addCorrectAnswerCount() {
    _correctAnswerCount++;
    debugPrint('Correct answers count: $_correctAnswerCount');
    notifyListeners();
  }

  void resetChances() {
    _chances = 3;
    _selectedAnswer = null;
    _selectedAnswerCorrect = null;
    _correctAnswer = null;
    _showAddToMaster = false;
    _isAnswerLocked = false;
    debugPrint('Chances reset. Back to $_chances');
    notifyListeners();
  }

  void addToMaster(bool value) {
    _isAddedToMaster = value;
    debugPrint('Added to master: $_isAddedToMaster');
    notifyListeners();
  }

  void toggleAddToMaster() {
    _isAddedToMaster = !_isAddedToMaster;
    debugPrint('Toggled add to master: $_isAddedToMaster');
    notifyListeners();
  }

  void setCorrectAnswerSelected(bool value) {
    _isCorrectAnswerSelected = value;
    _showAddToMaster = value;
    debugPrint('Correct answer selected: $_isCorrectAnswerSelected');
    notifyListeners();
  }

  void setCorrectAnswer(String answer) {
    _correctAnswer = answer;
    debugPrint('Correct answer set: $_correctAnswer');
    notifyListeners();
  }

  bool selectAnswer(bool isSelected) {
    _isAnswerSelected = isSelected;
    debugPrint('Answer selected state: $_isAnswerSelected');
    notifyListeners();
    return _isAnswerSelected;
  }

  void setSelectedAnswer(String answer, bool isCorrect, String correctAnswer) {
    if (_isAnswerLocked) return;

    _selectedAnswer = answer;
    _selectedAnswerCorrect = isCorrect;
    _isAnswerLocked = true;
    _correctAnswer = correctAnswer;

    debugPrint('Selected answer: $_selectedAnswer, Correct: $_selectedAnswerCorrect');
    notifyListeners();
  }

  void unlockAnswerSelection() {
    _isAnswerLocked = false;
    _selectedAnswer = null;
    _correctAnswer = correctAnswer;
    _selectedAnswerCorrect = null;
    debugPrint('Answer selection unlocked');
    notifyListeners();
  }

  bool setAddToMaster(bool value) {
    _isAddedToMaster = value;
    debugPrint('Set add to master: $_isAddedToMaster');
    notifyListeners();
    return _showAddToMaster;
  }
}
