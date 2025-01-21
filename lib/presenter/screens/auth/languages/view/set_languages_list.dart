import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

import '../provider/languages_provider.dart';

class SetLanguagesList extends StatelessWidget {
  const SetLanguagesList({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguagesProvider>();

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: ListView.builder(
          itemCount: languageProvider.languages.length,
          itemBuilder: (context, index) {
            final language = languageProvider.languages[index];
            final isSelected = pageIndex == 0
                ? languageProvider.selectedNativeLanguageIndex == index
                : languageProvider.selectedLearningLanguageIndex == index;

            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.itemBackground
                        : AppColors.unselectedItemBackground,
                    borderRadius: BorderRadius.circular(8).r,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.itemBorder
                          : Colors.transparent,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 12).r,
                    leading: Image.asset(
                      language['flag']!,
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                    ),
                    title: PrimaryText(
                      text: language['name']!,
                      color:
                      isSelected ? AppColors.primaryText : Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    selected: isSelected,
                    onTap: () {
                      if (pageIndex == 0) {
                        languageProvider.selectNativeLanguage(index);
                      } else {
                        languageProvider.selectLearningLanguage(index);
                      }
                      print('pageIndex: $pageIndex');
                    },
                  ),
                ),
                8.verticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }
}