import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final Icon? icon;
  final VoidCallback? onTap;

  const SettingsCard({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0).r,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryText(
                text: title,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
