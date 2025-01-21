import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/auth/reset-password/provider/resetPasswordProvider.dart';
import 'package:language_learning/presenter/screens/auth/reset-password/view/reset_password_body.dart';
import 'package:provider/provider.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => ResetPasswordProvider(),
        child: const ResetPasswordBody(),
      ),
    );
  }
}
