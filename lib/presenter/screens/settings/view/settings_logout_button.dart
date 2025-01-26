import 'package:flutter/material.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';

class SettingsLogoutButton extends StatelessWidget {
  const SettingsLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      title: 'Logout',
      hasBorder: false,
      isActive: true,
      onTap: () {

      },
    );
  }
}
