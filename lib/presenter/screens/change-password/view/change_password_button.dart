import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/change-password/provider/change_password_provider.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:provider/provider.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final changePasswordProvider = context.watch<ChangePasswordProvider>();

    return PrimaryButton(
      title: 'Confirm',
      hasBorder: false,
      isActive: changePasswordProvider.isFormValid(),
      onTap: () {},
    );
  }
}
