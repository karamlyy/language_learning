import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/presenter/screens/auth/verification/cubit/verification_cubit.dart';
import 'package:language_learning/presenter/screens/auth/verification/cubit/verification_state.dart';
import 'package:language_learning/presenter/widgets/primary_footer.dart';

class VerificationInfo extends StatelessWidget {
  final String userId;
  final String codeExpiry;

  const VerificationInfo({
    super.key,
    required this.userId,
    required this.codeExpiry,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerificationCubit, VerificationState>(
      builder: (context, state) {
        if (state is VerificationLoading) {
          return const CircularProgressIndicator();
        }

        return PrimaryFooter(
          onTap: () {},
          mainText: '00:20 ',
          secondaryText: 'Send code again',
        );
      },
    );
  }
}
