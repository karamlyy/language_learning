import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/timing/provider/change_timing_provider.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class ChangeTimingChips extends StatelessWidget {
  const ChangeTimingChips({super.key});

  @override
  Widget build(BuildContext context) {
    final changeTimingProvider = context.watch<ChangeTimingProvider>();

    return Wrap(
      spacing: 16.0.w,
      children: changeTimingProvider.intervals.map((interval) {
        final isSelected = changeTimingProvider.selectedIntervalId == interval.id;

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
              changeTimingProvider.selectInterval(interval.id);
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
