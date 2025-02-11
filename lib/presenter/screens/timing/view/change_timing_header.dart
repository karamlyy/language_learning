import 'package:flutter/material.dart';
import 'package:language_learning/presenter/widgets/heading_text.dart';

class ChangeTimingHeader extends StatelessWidget {
  const ChangeTimingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return HeadingText(
      headingText: 'Choosen time for learning',
      secondaryText: 'Choosen time for receiving notifications',
    );
  }
}
