import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/timing/view/change_timing_header.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class ChangeTimingForm extends StatelessWidget {
  const ChangeTimingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChangeTimingHeader(),
        42.verticalSpace,
        PrimaryText(
          text: 'Select Time Range',
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          textAlign: TextAlign.start,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildTimePickerField(
                context: context,
                label: 'Start time',
                selectedTime: null,
                onTimeSelected: (DateTime) {},
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: _buildTimePickerField(
                context: context,
                label: 'End time',
                selectedTime: null,
                onTimeSelected: (DateTime) {},
              ),
            ),
          ],
        ),
        32.verticalSpace,
        PrimaryText(
          text: 'Select Notification Interval',
          color: AppColors.primaryText,
          fontWeight: FontWeight.w600,
        ),
      ],
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
            text: label,
            color: AppColors.primaryText,
            fontWeight: FontWeight.w400,
          ),
          6.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.itemBorder),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryText(
                  text: selectedTime != null
                      ? DateFormat.jm().format(selectedTime)
                      : "00:00",
                  fontSize: 16,
                  color: selectedTime != null
                      ? AppColors.primaryText
                      : AppColors.primaryText.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
                ),
                Icon(
                  Icons.access_time,
                  size: 15.w,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
