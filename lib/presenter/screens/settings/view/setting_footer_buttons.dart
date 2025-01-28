import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:language_learning/presenter/widgets/settings_card.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class SettingsFooterButtons extends StatelessWidget {
  const SettingsFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsCard(
          title: 'Delete account',
          trailingIcon: Icon(CupertinoIcons.delete),
          iconColor: AppColors.hintText,
          onTap: (){},
        ),
        SettingsCard(
          title: 'Log out',
          trailingIcon: Icon(Icons.login_outlined),
          iconColor: AppColors.error,
          onTap: (){},
        ),
      ],
    );
  }
}
