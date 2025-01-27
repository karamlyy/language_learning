import 'package:flutter/material.dart';
import 'package:language_learning/presenter/widgets/heading_text.dart';

class SettingHeaderText extends StatelessWidget {
  const SettingHeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return HeadingText(
      headingText: 'Settings',
    );
  }
}
