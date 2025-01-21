import 'package:flutter/material.dart';
import 'package:language_learning/presenter/widgets/primary_footer.dart';

class ResetPasswordFooter extends StatelessWidget {
  const ResetPasswordFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryFooter(
      onTap: () {},
      mainText: 'Log in',
      secondaryText: 'Already have an account? ',
    );
  }
}