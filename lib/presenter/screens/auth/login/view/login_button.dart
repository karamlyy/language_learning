import 'package:flutter/material.dart';
import 'package:language_learning/generic/generic_builder.dart';
import 'package:language_learning/presenter/screens/auth/login/cubit/login_cubit.dart';
import 'package:language_learning/presenter/screens/auth/login/provider/login_provider.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<LoginProvider>();
    return GenericBlocBuilder<LoginCubit, void>(
      onInitial: (context) => PrimaryButton(
        title: 'Sign in',
        isActive: loginProvider.isFormValid,
        onTap: () {
          context.read<LoginCubit>().login(loginProvider.loginInput);
        },
        hasBorder: false,
      ),
      onLoading: (context) => const CircularProgressIndicator(),
      onSuccess: (context, data) => const SizedBox.shrink(),
      onFailure: (context, errorMessage) => PrimaryButton(
        title: 'Sign in',
        isActive: loginProvider.isFormValid,
        onTap: () {
          context.read<LoginCubit>().login(loginProvider.loginInput);
        },
        hasBorder: true,
      ),
    );
  }
}
