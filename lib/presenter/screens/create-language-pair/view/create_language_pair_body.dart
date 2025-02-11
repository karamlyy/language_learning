import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/data/model/language/language_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/auth/languages/cubit/language_cubit.dart';
import 'package:language_learning/presenter/screens/auth/languages/provider/languages_provider.dart';
import 'package:language_learning/presenter/screens/auth/languages/view/set_language_button.dart';
import 'package:language_learning/presenter/screens/auth/languages/view/set_languages_list.dart';
import 'package:language_learning/presenter/widgets/primary_text_form_field.dart';

class CreateLanguagePairBody extends StatelessWidget {
  const CreateLanguagePairBody({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.read<LanguageCubit>();
    final languagesProvider = context.read<LanguagesProvider>();

    return Padding(
      padding: const EdgeInsets.all(16.0).r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              PrimaryTextFormField(
                onTap: () {
                  _showLanguagesBottomSheet(
                      context, languageCubit, languagesProvider,
                      isSourceLanguage: true);
                },
                hint: languagesProvider.selectedSourceLanguageId.toString(),
                onChanged: (value) {},
                headText: 'Native',
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                ),
              ),
              16.verticalSpace,
              PrimaryTextFormField(
                onTap: () {
                  _showLanguagesBottomSheet(
                    context,
                    languageCubit,
                    languagesProvider,
                    isSourceLanguage: false,
                  );
                },
                hint:
                    languagesProvider.selectedTranslationLanguageId.toString(),
                onChanged: (value) {},
                headText: 'Learning',
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                ),
              ),
            ],
          ),
          SetLanguageButton(),
        ],
      ),
    );
  }

  void _showLanguagesBottomSheet(
    context,
    LanguageCubit languageCubit,
    LanguagesProvider languagesProvider, {
    required bool isSourceLanguage,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocBuilder<LanguageCubit, BaseState>(
          bloc: languageCubit,
          builder: (context, state) {
            if (state is SuccessState) {
              final languages = state.data as List<LanguageModel>;

              return Padding(
                padding: const EdgeInsets.all(16.0).r,
                child: Column(
                  children: [
                    Expanded(
                      child: SetLanguagesList(
                        languages: languages,
                        selectedLanguageId: isSourceLanguage
                            ? languagesProvider.selectedSourceLanguageId
                            : languagesProvider.selectedTranslationLanguageId,
                        onLanguageSelected: (languageId) {
                          if (isSourceLanguage) {
                            languagesProvider.selectSourceLanguage(languageId);
                          } else {
                            languagesProvider
                                .selectTranslationLanguage(languageId);
                          }
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FailureState) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        );
      },
    );
  }
}
