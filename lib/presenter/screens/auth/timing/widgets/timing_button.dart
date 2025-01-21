import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/auth/timing/provider/timing_provider.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:provider/provider.dart';


class TimingButton extends StatelessWidget {
  const TimingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final timingProvider = context.watch<TimingProvider>();

    return Padding(
      padding: EdgeInsets.only(left: 16.r, right: 16.r, bottom: 24.r),
      child: PrimaryButton(
        title: 'Continue',
        hasBorder: false,
        isActive: timingProvider.isSelectedInterval(),
        onTap: () {
          Navigation.push(Routes.home);
        },
      ),
    );
  }
}
