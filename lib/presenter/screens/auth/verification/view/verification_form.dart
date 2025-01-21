import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/auth/verification/provider/verification_provider.dart';
import 'package:language_learning/presenter/screens/auth/verification/view/verification_button.dart';
import 'package:language_learning/presenter/widgets/heading_text.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class VerificationForm extends StatelessWidget {
  const VerificationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final verificationProvider = context.watch<VerificationProvider>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeadingText(
            headingText: 'Verify your E-mail address',
            secondaryText:
            'We’ve sent an activation code to your email  konul@gmail.com',
          ),
          42.verticalSpace,
          Pinput(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            length: 4,
            defaultPinTheme: PinTheme(
              width: (double.infinity / 4),
              height: 70.h,
              textStyle: const TextStyle(
                fontSize: 28,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.inputBorder),
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            focusedPinTheme: PinTheme(
              width: (double.infinity / 5),
              height: 72.h,
              textStyle: const TextStyle(
                fontSize: 28,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryText),
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
          30.verticalSpace,
          VerificationButton(),
        ],
      ),
    );
  }
}