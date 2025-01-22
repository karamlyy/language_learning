import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/endpoint/auth/forgot_password_endpoint.dart';
import 'package:language_learning/presenter/screens/auth/forgot-password/cubit/forgot_password_cubit.dart';
import 'package:language_learning/presenter/screens/auth/forgot-password/cubit/forgot_password_state.dart';
import 'package:language_learning/presenter/screens/auth/forgot-password/provider/forgot_password_provider.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider = context.watch<ForgotPasswordProvider>();
    final forgotPasswordCubit = context.read<ForgotPasswordCubit>();
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        if (state is ForgotPasswordLoading) {
          return const CircularProgressIndicator();
        }
        return PrimaryButton(
          title: 'Send code',
          hasBorder: false,
          isActive: forgotPasswordProvider.isEmailValid(),
          onTap: () {
            forgotPasswordCubit.applyForgotPassword(forgotPasswordProvider.forgotPasswordInput);
          },
        );
      },
    );
  }
}
