import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/auth/verification/view/verification_footer.dart';
import 'package:language_learning/presenter/screens/auth/verification/view/verification_form.dart';
import 'package:language_learning/presenter/widgets/primary_header.dart';

class VerificationBody extends StatelessWidget {
  final String userId;
  final String codeExpiry;

  const VerificationBody({
    super.key,
    required this.userId,
    required this.codeExpiry,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          Text('user id: $userId'),
          Text('code expiry: $codeExpiry'),
          Expanded(
            child: ListView(
              children: [
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
