import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class HeadingText extends StatelessWidget {
  final String headingText;
  final String secondaryText;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextAlign? textAlign;


  const HeadingText({
    super.key,
    required this.headingText,
    required this.secondaryText,
    this.crossAxisAlignment,
    this.textAlign,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        PrimaryText(
          text: headingText,
          color: AppColors.primaryText,
          fontWeight: FontWeight.w400,
          fontFamily: 'DMSerifDisplay',
          fontSize: 30,
        ),
        12.verticalSpace,
        Opacity(
          opacity: 0.7,
          child: PrimaryText(
            text: secondaryText,
            color: AppColors.primaryText,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            textAlign: textAlign ?? TextAlign.start,
          ),
        ),
      ],
    );
  }
}
