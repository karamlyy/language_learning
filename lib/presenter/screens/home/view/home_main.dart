import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.0.h),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(16).r),
                      color: AppColors.unselectedItemBackground,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PrimaryText(
                              text: '120',
                              color: AppColors.primary,
                              fontWeight: FontWeight.w400,
                              fontSize: 36,
                              fontFamily: 'DMSerifDisplay',
                            ),
                            PrimaryText(
                              text: 'Vocabulary',
                              color: AppColors.primaryText.withValues(alpha: 0.8),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  12.verticalSpace,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16).r),
                      color: AppColors.unselectedItemBackground,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 10.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PrimaryText(
                              text: '17',
                              color: AppColors.primary,
                              fontWeight: FontWeight.w400,
                              fontSize: 36,
                              fontFamily: 'DMSerifDisplay',
                            ),
                            PrimaryText(
                              text: 'Learning now',
                              color: AppColors.primaryText.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            12.horizontalSpace,
            Expanded(

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16).r),
                  color: AppColors.unselectedItemBackground,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryText(
                          text: '24',
                          color: AppColors.primary,
                          fontWeight: FontWeight.w400,
                          fontSize: 36,
                          fontFamily: 'DMSerifDisplay',
                        ),
                        PrimaryText(
                          text: 'Mastered Words',
                          color: AppColors.primaryText.withOpacity(0.8),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
