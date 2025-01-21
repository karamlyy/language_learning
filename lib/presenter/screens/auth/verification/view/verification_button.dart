import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/presenter/screens/auth/register/cubit/register_cubit.dart';
import 'package:language_learning/presenter/screens/auth/verification/cubit/verification_cubit.dart';
import 'package:language_learning/presenter/screens/auth/verification/cubit/verification_state.dart';
import 'package:language_learning/presenter/screens/auth/verification/provider/verification_provider.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';

class VerificationButton extends StatelessWidget {
  const VerificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final verificationProvider = context.watch<VerificationProvider>();
    final verificationCubit = context.read<VerificationCubit>();
    return BlocBuilder<VerificationCubit, VerificationState>(
      builder: (context, state) {
        if (state is VerificationLoading) {
          return const CircularProgressIndicator();
        }
        return PrimaryButton(
          title: 'Verify Account',
          isActive: true,
          onTap: () async {
            //registerCubit.register(registerProvider.registerInput);
            verificationCubit.confirmEmail(verificationProvider.verificationInput);

          },
          hasBorder: false,
        );
      },
    );
  }
}
