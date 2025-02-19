import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/generic/generic_builder.dart';
import 'package:language_learning/presenter/screens/new-word/cubit/new_word_cubit.dart';
import 'package:language_learning/presenter/screens/new-word/provider/new_word_provider.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/presenter/widgets/primary_text_form_field.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

/*
class NewWordInputs extends StatelessWidget {
  const NewWordInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final newWordProvider = context.watch<NewWordProvider>();

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
                  BlocBuilder<NewWordCubit, BaseState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const CircularProgressIndicator();
                      }
                      if (state is SuccessState) {
                        final selectedPair = newWordProvider
                                .selectedLanguagePair ??
                            newWordProvider.getSelectedLanguagePair(state.data);
                        return PrimaryText(
                          text: selectedPair?.sourceLanguage,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'DMSerifDisplay',
                        );
                      } else {
                        return Text('failed to load ');
                      }
                    },
                  ),
                  PrimaryTextFormField(
                    initialText: newWordProvider.word,
                    onChanged: (value) => newWordProvider.updateWord(value),
                    isFilled: false,
                    defaultBorderColor: Colors.transparent,
                    defaultEnabledBorderColor: Colors.transparent,
                    defaultFocusedBorderColor: Colors.transparent,
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
                  BlocBuilder<NewWordCubit, BaseState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const CircularProgressIndicator();
                      }
                      if (state is SuccessState) {
                        final selectedPair = newWordProvider
                            .selectedLanguagePair ??
                            newWordProvider.getSelectedLanguagePair(state.data);
                        return PrimaryText(
                          text: selectedPair?.translationLanguage,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'DMSerifDisplay',
                        );
                      } else {
                        return Text('failed to load ');
                      }
                    },
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
              newWordProvider.addLearning(!newWordProvider.isLearningNow);
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
                    newWordProvider.isLearningNow
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


 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/data/model/home/language_pair_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/new-word/cubit/new_word_cubit.dart';
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
              padding: EdgeInsets.all(12.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<List<LanguagePairModel>>(
                    stream: context.read<NewWordCubit>().languagePairController,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const PrimaryText(
                          text: 'Failed to load',
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'DMSerifDisplay',
                        );
                      } else if (snapshot.hasData) {
                        final languagePairs = snapshot.data!;
                        final selectedPair = newWordProvider.selectedLanguagePair ??
                            newWordProvider.getSelectedLanguagePair(languagePairs);
                        return PrimaryText(
                          text: selectedPair?.sourceLanguage ?? 'No source language',
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'DMSerifDisplay',
                        );
                      } else {
                        return const PrimaryText(
                          text: 'No data available',
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'DMSerifDisplay',
                        );
                      }
                    },
                  ),
                  // Text field for entering the word.
                  PrimaryTextFormField(
                    initialText: newWordProvider.word,
                    onChanged: (value) => newWordProvider.updateWord(value),
                    isFilled: false,
                    defaultBorderColor: Colors.transparent,
                    defaultEnabledBorderColor: Colors.transparent,
                    defaultFocusedBorderColor: Colors.transparent,
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
              padding: EdgeInsets.all(12.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<List<LanguagePairModel>>(
                    stream: context.read<NewWordCubit>().languagePairController,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const PrimaryText(
                          text: 'Failed to load',
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'DMSerifDisplay',
                        );
                      } else if (snapshot.hasData) {
                        final languagePairs = snapshot.data!;
                        final selectedPair = newWordProvider.selectedLanguagePair ??
                            newWordProvider.getSelectedLanguagePair(languagePairs);
                        return PrimaryText(
                          text: selectedPair?.translationLanguage ?? 'No translation language',
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'DMSerifDisplay',
                        );
                      } else {
                        return const PrimaryText(
                          text: 'No data available',
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          fontFamily: 'DMSerifDisplay',
                        );
                      }
                    },
                  ),
                  PrimaryTextFormField(
                    initialText: newWordProvider.translation,
                    onChanged: (value) => newWordProvider.updateTranslation(value),
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
              newWordProvider.addLearning(!newWordProvider.isLearningNow);
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
                    newWordProvider.isLearningNow
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
