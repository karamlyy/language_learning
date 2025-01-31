import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class CategoryCard extends StatelessWidget {
  final int id;
  final String groupName;
  final int allWords;
  final int masteredWords;
  final SvgPicture? icon;

  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.id,
    required this.groupName,
    required this.allWords,
    required this.masteredWords,
    this.icon,
    required this.onTap,
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

          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                    text: groupName,
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    fontFamily: 'DMSerifDisplay',
                  ),
                  PrimaryText(
                    text: 'Mastered $masteredWords of $allWords',
                    color: AppColors.primaryText.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
