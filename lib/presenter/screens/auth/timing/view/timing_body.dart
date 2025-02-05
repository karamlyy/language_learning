import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/auth/timing/view/timing_button.dart';
import 'package:language_learning/presenter/screens/auth/timing/view/timing_form.dart';
import 'package:language_learning/presenter/widgets/primary_header.dart';

class TimingBody extends StatelessWidget {
  const TimingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimingForm(),
                TimingButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
