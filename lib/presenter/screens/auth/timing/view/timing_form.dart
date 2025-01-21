import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/auth/timing/provider/timing_provider.dart';
import 'package:language_learning/presenter/screens/auth/timing/view/timing_interval_chips.dart';
import 'package:language_learning/presenter/widgets/heading_text.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

import '../widgets/time_picker_field.dart';

class TimingForm extends StatelessWidget {
  const TimingForm({super.key});

  @override
  Widget build(BuildContext context) {
    final timingProvider = context.watch<TimingProvider>();

    return Padding(
      padding: const EdgeInsets.all(16.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadingText(
            headingText: 'What’s the Best Time for Learning?',
            secondaryText:
            'Tell us when and how often you would like to receive notifications. You can adjust these settings anytime to fit your schedule.',
          ),
          42.verticalSpace,
          const PrimaryText(
            text: 'Select Time Range',
            color: AppColors.primaryText,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            textAlign: TextAlign.start,
          ),
          14.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PrimaryText(
                      text: 'Start time',
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                    6.verticalSpace,
                    TimePickerField(
                      label: '00:00',

                      selectedTime: timingProvider.startTime,
                      onTimeSelected: (time) {
                        timingProvider.setStartTime(time);
                      },
                    ),
                  ],
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PrimaryText(
                      text: 'End time',
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                    6.verticalSpace,
                    TimePickerField(
                      label: '23:59',
                      selectedTime: timingProvider.endTime  ,
                      onTimeSelected: (time) {
                        timingProvider.setEndTime(time);
                      },

                    ),
                  ],
                ),
              ),
            ],
          ),
          32.verticalSpace,
          const PrimaryText(
            text: 'Select Notification Interval',
            color: AppColors.primaryText,
            fontWeight: FontWeight.w600,
            fontSize: 16,
            textAlign: TextAlign.start,
          ),
          14.verticalSpace,
          const TimingIntervalChips(),
        ],
      ),
    );
  }
}