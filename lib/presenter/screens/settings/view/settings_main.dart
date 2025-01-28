import 'package:flutter/cupertino.dart';
import 'package:language_learning/presenter/screens/settings/provider/settings_provider.dart';
import 'package:language_learning/presenter/widgets/settings_card.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class SettingsMain extends StatelessWidget {
  const SettingsMain({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = context.watch<SettingsProvider>();

    return Expanded(
      child: ListView.builder(
        itemCount: settingsProvider.settings.length,
        itemBuilder: (BuildContext context, int index) {
          final setting = settingsProvider.settings[index];
          return SettingsCard(
            title: setting.title,
            leadingIcon: setting.leadingIcon,
            trailingIcon: setting.trailingIcon,
            iconColor: AppColors.primary,
            onTap: () {},
          );
        },
      ),
    );
  }
}
