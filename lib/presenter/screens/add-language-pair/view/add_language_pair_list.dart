import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/data/model/home/language_pair_model.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class AddLanguagePairList extends StatelessWidget {
  final List<LanguagePairModel> languagePairs;

  const AddLanguagePairList({
    super.key,
    required this.languagePairs,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: languagePairs.length,
        itemBuilder: (context, index) {
          final languagePair = languagePairs[index];
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.w,
              vertical: 5.h,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.all(12).r,
              tileColor: languagePair.isSelected
                  ? AppColors.itemBackground
                  : AppColors.unselectedItemBackground,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24).r,
                borderSide: BorderSide(
                    color: languagePair.isSelected
                        ? AppColors.itemBorder
                        : Colors.transparent),
              ),
              title: PrimaryText(
                text:
                    '${languagePair.sourceLanguage} - ${languagePair.translationLanguage}',
                color: AppColors.primaryText,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}
