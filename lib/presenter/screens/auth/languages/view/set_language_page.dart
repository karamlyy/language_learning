import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/auth/languages/cubit/language_cubit.dart';
import 'package:language_learning/presenter/screens/auth/languages/provider/languages_provider.dart';
import 'package:language_learning/presenter/widgets/primary_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'set_language_body.dart';

class SetLanguagePage extends StatelessWidget {
  const SetLanguagePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit()..getAllLanguages(),
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => LanguagesProvider(),
          child: BlocListener<LanguageCubit, BaseState>(
            listener: (context, state) {
              if (state is SuccessState) {
                print('Languages fetched successfully');
              } else if (state is FailureState) {
                PrimaryBottomSheet.show(
                  context,
                  text: 'Failed to fetch languages: ${state.errorMessage}',
                );
              }
            },
            child: SetLanguageBody(),
          ),
        ),
      ),
    );
  }
}
