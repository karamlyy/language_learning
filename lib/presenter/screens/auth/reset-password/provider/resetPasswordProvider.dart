import 'package:flutter/material.dart';
import 'package:language_learning/utils/extensions/validation.dart';

class ResetPasswordProvider extends ChangeNotifier {
  String _password = '';
  String _confirmPassword = '';

  String? _passwordError;
  String? _confirmPasswordError;

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool _isTextFieldClicked = false;

  String get password => _password;
  String get confirmPassword => _confirmPassword;


  String? get passwordError => _passwordError;
  String? get confirmPasswordError => _confirmPasswordError;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  bool get isTextFormClicked => _isTextFieldClicked;

  void changePasswordVisibility(bool value) {
    _isPasswordVisible = value;
    notifyListeners();
  }

  void changeConfirmPasswordVisibility(bool value) {
    _isConfirmPasswordVisible = value;
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    if (password.isValidPassword()) {
      _passwordError = null;
    } else {
      _passwordError = 'Password is too short';
    }
    notifyListeners();
  }

  void updateConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    if (confirmPassword.isValidPassword()) {
      _confirmPasswordError = null;
    } else {
      _confirmPasswordError = 'Password is too short';
    }
    notifyListeners();
  }


  bool isPasswordValid() {
    return _password.length >= 8 ;
  }

  bool isConfirmPasswordValid() {
    return _confirmPassword.length >= 8;
  }

  bool isPasswordMatch() {
    return _password == _confirmPassword && isPasswordValid() && isConfirmPasswordValid();
  }

  bool isFormValid() {
    return isPasswordValid();
  }
}
