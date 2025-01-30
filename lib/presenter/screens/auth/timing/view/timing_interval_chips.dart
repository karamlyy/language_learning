import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/auth/timing/provider/timing_provider.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class TimingIntervalChips extends StatelessWidget {
  const TimingIntervalChips({super.key});

  @override
  Widget build(BuildContext context) {
    final timingProvider = context.watch<TimingProvider>();

    return Wrap(
      spacing: 16.0.w,
      children: timingProvider.intervals.map((interval) {
        final isSelected = timingProvider.selectedIntervalId == interval.id;

        return ChoiceChip(
          showCheckmark: false,
          label: PrimaryText(
            text: interval.title,
            color: AppColors.primaryText,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
          selected: isSelected,
          onSelected: (selected) {
            if (selected) {
              timingProvider.selectInterval(interval.id);
            }
          },
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(44.0).r,
              side: const BorderSide(color: AppColors.itemBorder)),
          selectedColor: AppColors.itemBackground,
          backgroundColor: AppColors.unselectedItemBackground,
        );
      }).toList(),
    );
  }
}
