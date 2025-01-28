import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/settings/provider/settings_provider.dart';
import 'package:language_learning/presenter/screens/settings/view/settings_body.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PrimaryText(
          text: 'Settings',
          color: AppColors.primaryText,
          fontWeight: FontWeight.w400,
          fontFamily: 'DMSerifDisplay',
          fontSize: 20,
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => SettingsProvider(),
        child: SettingsBody(),
      ),
    );
  }
}
