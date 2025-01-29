import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/model/auth/verification_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/auth/timing/cubit/timing_cubit.dart';
import 'package:language_learning/presenter/screens/auth/timing/provider/timing_provider.dart';
import 'package:language_learning/presenter/screens/auth/timing/view/timing_body.dart';
import 'package:language_learning/presenter/widgets/primary_bottom_sheet.dart';
import 'package:provider/provider.dart';

class TimingPage extends StatelessWidget {
  final VerificationModel verificationModel;

  const TimingPage({
    super.key,
    required this.verificationModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimingCubit(verificationModel),
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) =>
              TimingProvider()..setUserId(verificationModel.userId),
          child: BlocListener<TimingCubit, BaseState>(
            listener: (context, state) {
              if (state is SuccessState) {

              } else if (state is FailureState) {
                PrimaryBottomSheet.show(
                  context,
                  text: 'Failed to fetch timings: ${state.errorMessage}',
                );
              }
            },
            child: TimingBody(
              userId: verificationModel.userId,
            ),
          ),
        ),
      ),
    );
  }
}
