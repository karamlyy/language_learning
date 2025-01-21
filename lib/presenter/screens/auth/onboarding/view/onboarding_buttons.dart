import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:language_learning/utils/l10n/l10n.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryButton(
            title: L10n.signIn,
            hasBorder: false,
            isActive: true,
            backgroundColor: AppColors.primary,
            onTap: () {
              Navigation.push(Routes.login);
            },
          ),
          14.verticalSpace,
          PrimaryButton(
            title: L10n.createAccount,
            isActive: true,
            hasBorder: true,
            onTap: () {
              Navigation.push(Routes.register);
            },
          ),
          50.verticalSpace,
        ],
      ),
    );
  }
}