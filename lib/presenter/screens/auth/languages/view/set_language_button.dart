import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/auth/languages/cubit/language_cubit.dart';
import 'package:language_learning/presenter/screens/auth/languages/cubit/language_state.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';

import '../provider/languages_provider.dart';

class SetLanguageButton extends StatelessWidget {
  const SetLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguagesProvider>();
    final languageCubit = context.read<LanguageCubit>();
    return BlocBuilder<LanguageCubit, BaseState> (
      builder: (context, state) {
        if (state is SetLanguageLoading) {
          return const CircularProgressIndicator();
        }
        return Padding(
          padding: EdgeInsets.only(left: 16.r, right: 16.r, bottom: 24.r),
          child: PrimaryButton(
            title: 'Continue',
            hasBorder: false,
            isActive: true,
            onTap: () async {
              languageCubit.setLanguage(languageProvider.setLanguageInput);
            },
          ),
        );
      },
    );
  }
}
