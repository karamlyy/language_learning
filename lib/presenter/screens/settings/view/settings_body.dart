import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/settings/view/settings_logout_button.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const PrimaryText(
            text: 'Settings',
            color: AppColors.primaryText,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 20),
          const SettingsLogoutButton(),
        ],
      ),
    );
  }
}
