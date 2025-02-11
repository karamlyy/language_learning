import 'package:flutter/material.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';

class ChangeTimingButton extends StatelessWidget {
  const ChangeTimingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      title: 'Change',
      hasBorder: false,
      isActive: true,
      onTap: () {},
    );
  }
}
