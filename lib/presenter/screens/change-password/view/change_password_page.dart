import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/change-password/provider/change_password_provider.dart';
import 'package:language_learning/presenter/screens/change-password/view/change_password_body.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PrimaryText(
          text: 'Password',
          color: AppColors.primaryText,
          fontWeight: FontWeight.w400,
          fontFamily: 'DMSerifDisplay',
          fontSize: 20,
        ),
      ),
      body: ChangeNotifierProvider(create: (context) => ChangePasswordProvider(),
        child: ChangePasswordBody(),
      ),
    );
  }
}

/*
return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => ResetPasswordProvider()..setUserId(forgotPasswordModel.userId ?? ''),
          child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccess) {
                print("Successful ResetPassword");
              } else if (state is ResetPasswordFailure) {
                //PrimaryBottomSheet.show(context, text: state.errorMessage.message);
              }
            },
            child: ResetPasswordBody(userId: forgotPasswordModel.userId ?? '', codeExpiry: '',),
          ),
        ),
      ),
    );
  }
 */
