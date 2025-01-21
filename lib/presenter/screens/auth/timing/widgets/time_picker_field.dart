import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/utils/colors/app_colors.dart';


class TimePickerField extends StatelessWidget {
  final String label;
  final String? selectedTime;
  final Function(String) onTimeSelected;

  const TimePickerField({
    super.key,
    required this.label,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 16.sp,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.background,
        labelText: label,
        labelStyle: TextStyle(fontSize: 16.sp),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.inputBorder,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.inputBorder,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 16.h,
        ),
        suffixIcon: Icon(
          Icons.access_time,
          size: 16.h,
          color: AppColors.primaryText.withOpacity(0.6),
        ),
      ),
      onTap: () async {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: Container(),
          ),
        );
        if (pickedTime != null) {
          final formattedTime = pickedTime.format(context);
          onTimeSelected(formattedTime);
        }
      },
      controller: TextEditingController(
        text: selectedTime,
      ),
    );
  }
}
