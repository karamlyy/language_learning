import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:provider/provider.dart';

import '../provider/languages_provider.dart';

class SetLanguageButton extends StatelessWidget {
  const SetLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguagesProvider>();

    return Padding(
      padding: EdgeInsets.only(left: 16.r, right: 16.r, bottom: 24.r),
      child: PrimaryButton(
        title: 'Continue',
        hasBorder: false,
        isActive: languageProvider.pageIndex == 0
            ? (languageProvider.isNativeLanguageSelected ? true : false)
            : (languageProvider.isLearningLanguageSelected ? true : false),
        //isActive: languageProvider.isNativeLanguageSelected ? true : false,
        onTap: () {
          languageProvider.goToNextPage(languageProvider.pageIndex);
        },
      ),
    );
  }
}
