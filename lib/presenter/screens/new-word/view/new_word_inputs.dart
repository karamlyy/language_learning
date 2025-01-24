import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/new-word/provider/new_word_provider.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/presenter/widgets/primary_text_form_field.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class NewWordInputs extends StatelessWidget {
  const NewWordInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final newWordProvider = context.watch<NewWordProvider>();

    //final wordController = TextEditingController(text: newWordProvider.word);
    //final translationController = TextEditingController(text: newWordProvider.translation);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(10).r,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                    text: 'English',
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    fontFamily: 'DMSerifDisplay',
                  ),
                  PrimaryTextFormField(
                    initialText: newWordProvider.word,
                    onChanged: (value) => newWordProvider.updateWord(value),
                    isFilled: false,
                    defaultBorderColor: Colors.transparent,
                    defaultEnabledBorderColor: Colors.transparent,
                    defaultFocusedBorderColor: Colors.transparent,
                    //controller: wordController,
                  )
                ],
              ),
            ),
          ),
          16.verticalSpace,
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(10).r,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                    text: 'Spanish',
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    fontFamily: 'DMSerifDisplay',
                  ),
                  PrimaryTextFormField(
                    initialText: newWordProvider.translation,
                    onChanged: (value) =>
                        newWordProvider.updateTranslation(value),
                    isFilled: false,
                    defaultBorderColor: Colors.transparent,
                    defaultEnabledBorderColor: Colors.transparent,
                    defaultFocusedBorderColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          16.verticalSpace,
          CupertinoButton(
            pressedOpacity: 1,
            padding: EdgeInsets.zero,
            onPressed: () {
              newWordProvider.addLearning(!newWordProvider.isAddedLearning);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
              child: Row(
                children: [
                  const PrimaryText(
                    haveUnderline: TextDecoration.underline,
                    text: 'Add to Learning now',
                    color: AppColors.primary,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  12.horizontalSpace,
                  Icon(
                    newWordProvider.isAddedLearning
                        ? Icons.bookmark
                        : Icons.bookmark_outline,
                    color: AppColors.primary,
                    size: 20.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
