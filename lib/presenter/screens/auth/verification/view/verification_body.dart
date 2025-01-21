import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/auth/verification/view/verification_footer.dart';
import 'package:language_learning/presenter/screens/auth/verification/view/verification_form.dart';
import 'package:language_learning/presenter/widgets/primary_header.dart';

class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Expanded(
            child: ListView(
              children: const [
                VerificationForm(),
              ],
            ),
          ),
          const VerificationFooter(),
        ],
      ),
    );
  }
}