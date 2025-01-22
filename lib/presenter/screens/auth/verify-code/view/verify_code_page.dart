import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/auth/verify-code/view/verify_code_body.dart';

class VerifyCodePage extends StatelessWidget {
  const VerifyCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const VerifyCodeBody(),
    );
  }
}
