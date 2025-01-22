import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/presenter/screens/auth/forgot-password/cubit/forgot_password_cubit.dart';
import 'package:language_learning/presenter/screens/auth/forgot-password/cubit/forgot_password_state.dart';
import 'package:language_learning/presenter/screens/auth/forgot-password/provider/forgot_password_provider.dart';
import 'package:language_learning/presenter/widgets/primary_bottom_sheet.dart';
import 'package:provider/provider.dart';

import 'forgot_password_body.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => ForgotPasswordProvider(),
          child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordSuccess) {
                print("Successful forgot password");
              } else if (state is ForgotPasswordFailure) {
                PrimaryBottomSheet.show(context,
                    text: 'failed to send email');
              }
            },
            child: const ForgotPasswordBody(),
          ),
        ),
      ),
    );
  }
}