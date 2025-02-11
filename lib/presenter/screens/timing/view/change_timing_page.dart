import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/timing/view/change_timing_body.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class ChangeTimingPage extends StatelessWidget {
  const ChangeTimingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PrimaryText(
          text: 'Settings',
          color: AppColors.primaryText,
          fontWeight: FontWeight.w400,
          fontSize: 20,
          fontFamily: 'DMSerifDisplay',
        ),
      ),
      body: ChangeTimingBody(),
    );
  }
}
