import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/auth/verify-code/view/verify_code_form.dart';
import 'package:language_learning/presenter/widgets/primary_header.dart';

class VerifyCodeBody extends StatelessWidget {
  const VerifyCodeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: ListView(
              children: [
                VerifyCodeForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
