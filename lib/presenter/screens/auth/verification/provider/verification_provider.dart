import 'package:flutter/material.dart';
import 'package:language_learning/data/endpoint/auth/verification_endpoint.dart';

class VerificationProvider extends ChangeNotifier {
  String _code = '';
  String _userId = '';
  String _codeExpiry = '';
  String? _error;

  String get code => _code;

  String get userId => _userId;

  String get codeExpiry => _codeExpiry;

  String? get error => _error;

  void updateVerificationCode(String code) {
    _code = code;

    notifyListeners();
  }

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  void setCodeExpiry(String codeExpiry) {
    _codeExpiry = codeExpiry;
    notifyListeners();
  }



  VerificationInput get verificationInput => VerificationInput(userId: _userId, code: _code);



}
