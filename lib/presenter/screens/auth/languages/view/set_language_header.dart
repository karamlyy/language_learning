import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/auth/languages/provider/languages_provider.dart';
import 'package:language_learning/presenter/widgets/heading_text.dart';
import 'package:provider/provider.dart';

class SetLanguageHeader extends StatelessWidget {
  const SetLanguageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguagesProvider>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText(
              headingText: 'Choose native language',
              secondaryText:
                  'Select your native language to personalize your learning experience easily.'),
        ],
      ),
    );
  }
}
