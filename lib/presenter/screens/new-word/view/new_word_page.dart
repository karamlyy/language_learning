import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/new-word/cubit/new_word_cubit.dart';
import 'package:language_learning/presenter/screens/new-word/provider/new_word_provider.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

import 'new_word_body.dart';

class NewWordPage extends StatelessWidget {
  const NewWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewWordCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: PrimaryText(
            text: 'New word',
            color: AppColors.primaryText,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            fontFamily: 'DMSerifDisplay',
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => NewWordProvider(),
          child: BlocListener<NewWordCubit, BaseState>(
            listener: (context, state) {
              if (state is SuccessState) {
                toastification.show(
                  context: context,
                  title: PrimaryText(
                    text: 'Word saved successfully!',
                    color: AppColors.inputBackground,
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.start,
                  ),
                  showProgressBar: false,
                  backgroundColor: AppColors.toastBackground,
                  icon: Icon(
                    CupertinoIcons.check_mark_circled,
                    color: Colors.white,
                    size: 20.w,
                  ),
                  alignment: Alignment.bottomCenter,
                  autoCloseDuration: Duration(seconds: 3),
                  padding: EdgeInsets.all(12).r,
                );
              } else if (state is FailureState) {
                toastification.show(
                  context: context,
                  title: PrimaryText(
                    text: 'An error occurred!',
                    color: AppColors.inputBackground,
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.start,
                  ),
                  showProgressBar: false,
                  backgroundColor: AppColors.toastBackground,
                  icon: Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: Colors.white,
                    size: 20.w,
                  ),
                  alignment: Alignment.bottomCenter,
                  autoCloseDuration: Duration(seconds: 3),
                  padding: EdgeInsets.all(12).r,
                );
              }
            },
            child: NewWordBody(),
          ),
        ),
      ),
    );
  }
}
