import 'package:flutter/material.dart';
import 'package:language_learning/utils/extensions/validation.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  String _email = '';

  String? _emailError;

  String get email => _email;

  String? get emailError => _emailError;

  void updateEmail(String email) {
    _email = email;
    if (email.isValidEmail()) {
      _emailError = null;
    } else {
      _emailError = 'Email format is invalid';
    }
    notifyListeners();
  }

  bool isEmailValid() {
    final isValid = _emailError == null && _email.isNotEmpty;
    return isValid;
  }
}