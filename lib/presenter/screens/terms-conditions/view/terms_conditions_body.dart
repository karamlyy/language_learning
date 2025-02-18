import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsConditionsBody extends StatelessWidget {
  const TermsConditionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          children: [
            Text('Terms and Conditions')
          ],
        ),
      ),
    );
  }
}
