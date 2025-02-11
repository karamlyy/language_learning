import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/generic/generic_builder.dart';
import 'package:language_learning/presenter/screens/auth/login/cubit/login_cubit.dart';
import 'package:language_learning/presenter/screens/auth/login/provider/login_provider.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<LoginProvider>();
    final loginCubit = context.read<LoginCubit>();
    return GenericBuilder<LoginCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const CircularProgressIndicator();
        }
        return PrimaryButton(
          title: 'Sign in',
          isActive: loginProvider.isFormValid,
          onTap: () async {
            loginCubit.login(loginProvider.loginInput);
          },
          hasBorder: false,
        );
      },
    );
  }
}