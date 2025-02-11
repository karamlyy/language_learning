import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/auth/languages/cubit/language_cubit.dart';
import 'package:language_learning/presenter/screens/auth/languages/provider/languages_provider.dart';
import 'package:language_learning/presenter/screens/create-language-pair/view/create_language_pair_body.dart';
import 'package:language_learning/presenter/widgets/primary_bottom_sheet.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class CreateLanguagePairPage extends StatelessWidget {
  const CreateLanguagePairPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit()..getAllLanguages(),
      child: Scaffold(
        appBar: AppBar(
          title: PrimaryText(
            text: 'Languages',
            color: AppColors.primaryText,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            fontFamily: 'DMSerifDisplay',
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => LanguagesProvider(),
          child: BlocListener<LanguageCubit, BaseState>(
            listener: (context, state) {
              if (state is FailureState) {
                PrimaryBottomSheet.show(
                  context,
                  text: 'Failed to fetch languages: ${state.errorMessage}',
                );
              }
            },
            child: CreateLanguagePairBody(),
          ),
        ),
      ),
    );
  }
}
