import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/auth/timing/provider/timing_provider.dart';
import 'package:language_learning/presenter/screens/auth/timing/view/timing_interval_chips.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class TimingForm extends StatelessWidget {
  const TimingForm({super.key});

  @override
  Widget build(BuildContext context) {
    final timingProvider = context.watch<TimingProvider>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimePickerField(
            context: context,
            label: "Start Time",
            selectedTime: timingProvider.startTime,
            onTimeSelected: (time) => timingProvider.setStartTime(time),
          ),
          16.verticalSpace,
          _buildTimePickerField(
            context: context,
            label: "End Time",
            selectedTime: timingProvider.endTime,
            onTimeSelected: (time) => timingProvider.setEndTime(time),
          ),
          16.verticalSpace,
          TimingIntervalChips(),
        ],
      ),
    );
  }

  Widget _buildTimePickerField({
    required BuildContext context,
    required String label,
    required DateTime? selectedTime,
    required Function(DateTime) onTimeSelected,
  }) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime != null
              ? TimeOfDay.fromDateTime(selectedTime)
              : TimeOfDay.now(),
        );

        if (pickedTime != null) {
          DateTime now = DateTime.now();
          DateTime selectedDateTime = DateTime(
            now.year,
            now.month,
            now.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          onTimeSelected(selectedDateTime);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.unselectedItemBackground,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.itemBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryText(
              text: label,
              fontSize: 16.sp,
              color: AppColors.primaryText.withValues(alpha: 0.7), fontWeight: FontWeight.w400,
            ),
            PrimaryText(
              text: selectedTime != null
                  ? DateFormat.jm().format(selectedTime)
                  : "Select Time",
              fontSize: 16.sp,
              color: selectedTime != null
                  ? AppColors.primaryText
                  : AppColors.primaryText.withValues(alpha: 0.7),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
