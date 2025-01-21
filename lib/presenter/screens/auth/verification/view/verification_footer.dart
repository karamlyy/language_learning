import 'package:flutter/material.dart';
import 'package:language_learning/presenter/widgets/primary_footer.dart';

class VerificationFooter extends StatelessWidget {
  const VerificationFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryFooter(
      onTap: () {},
      mainText: 'Resend',
      secondaryText: 'I didn’t receive a code. ',
    );
  }
}