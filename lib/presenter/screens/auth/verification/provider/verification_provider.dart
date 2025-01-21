import 'package:flutter/material.dart';
import 'package:language_learning/data/endpoint/auth/verification_endpoint.dart';
import 'package:language_learning/data/model/auth/register_model.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';

class VerificationProvider extends ChangeNotifier {


  String _code = '';
  String _userId = '';
  String? _error;


  String get code => _code;
  String get userId => _userId;
  String? get error => _error;





  void loadUser() async {
    final prefs = await PreferencesService.instance;
    _userId = prefs.userId!;
    notifyListeners();
  }

  void updateEmail(String email) {
    _code = code;
    if (code.length == 4) {
      _error = null;
    } else {
      _error = 'Otp is wrong';
    }
    notifyListeners();
  }


  VerificationInput get verificationInput => VerificationInput(userId: _userId, code: _code);

}
