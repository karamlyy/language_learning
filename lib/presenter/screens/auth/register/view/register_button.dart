import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/presenter/screens/auth/register/cubit/register_cubit.dart';
import 'package:language_learning/presenter/screens/auth/register/cubit/register_state.dart';
import 'package:language_learning/presenter/screens/auth/register/provider/register_provider.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final registerProvider = context.watch<RegisterProvider>();
    final registerCubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const CircularProgressIndicator();
        }
        return PrimaryButton(
          title: 'Create account',
          isActive: registerProvider.isFormValid,
          onTap: () async {
            registerCubit.register(registerProvider.registerInput);
          },
          hasBorder: false,
        );
      },
    );
  }
}
