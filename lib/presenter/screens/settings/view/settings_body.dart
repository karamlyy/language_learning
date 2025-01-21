import 'package:flutter/material.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrimaryText(
        text: 'Settings',
        color: AppColors.primaryText,
        fontWeight: FontWeight.w400,
        fontSize: 24,
        fontFamily: 'DMSerifDisplay',
      ),
    );
  }
}
