import 'package:flutter/material.dart';

class VerificationProvider extends ChangeNotifier {
  bool _isOtpCompleted = false;
  bool _isOtpCorrect = true;
  bool _isOtpExpired = false;

  bool get isOtpCompleted => _isOtpCompleted;

  bool get isOtpCorrect => _isOtpCorrect;

  bool get isOtpExpired => _isOtpExpired;

  void setOtpCompleted(bool value) {
    _isOtpCompleted = value;
    notifyListeners();
  }

  void setOtpCorrect(bool value) {
    _isOtpCorrect = value;
    notifyListeners();
  }

  void setOtpExpired(bool value) {
    _isOtpExpired = value;
    notifyListeners();
  }

  void verifyOtp(String enteredOtp) {
    String actualOtp = "1234";

    if (enteredOtp == actualOtp) {
      setOtpCompleted(true);
      setOtpCorrect(true);
      setOtpExpired(false);
    } else {
      setOtpCompleted(true);
      setOtpCorrect(false);
      setOtpExpired(false);
    }
  }

  void checkOtpExpiration() async {
    await Future.delayed(Duration(seconds: 2));

    if (_isOtpCompleted && !_isOtpCorrect) {
      return;
    }

    setOtpExpired(true);
  }
}
