import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/settings/settings_options.dart';
import 'package:language_learning/presenter/widgets/settings_card.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class SettingsFooterButtons extends StatelessWidget {
  const SettingsFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsCard(
          title: SettingsOption.deleteAccount.title,
          trailingIcon: Icon(SettingsOption.deleteAccount.icon),
          iconColor: AppColors.hintText,
          onTap: () {

          },
        ),
        SettingsCard(
          title: SettingsOption.logout.title,
          trailingIcon: Icon(SettingsOption.logout.icon),
          iconColor: AppColors.error,
          onTap: () {

          },
        ),
      ],
    );
  }
}
