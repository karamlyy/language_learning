import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:language_learning/utils/asset-paths/app_assets.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';



class SecondaryFloatingBottomNavbar extends StatelessWidget {
  const SecondaryFloatingBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          Images.bottomNavigationBackground,
          fit: BoxFit.cover,
          width: 208.w,
          height: 72.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48.w,
              height: 48.h,
              decoration: const BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                constraints: BoxConstraints(),
                onPressed: () {
                  print('home kliklendi');
                },
                icon: Icon(
                  Icons.home_filled,
                  color: AppColors.primary,
                  size: 24.w,
                ),
              ),
            ),
            if (!isTablet) 18.horizontalSpace,
            Container(
              width: isTablet ? 58.w : 64.h,
              height: 64.h,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigation.push(Routes.newWord);
                },
                icon: Icon(
                  Icons.add,
                  color: AppColors.background,
                  size: 28.w,
                ),
              ),
            ),
            if (!isTablet) 18.horizontalSpace,
            Container(
              width: 48.w,
              height: 48.h,
              decoration: const BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigation.push(Routes.settings);
                },
                icon: Icon(
                  Icons.settings_rounded,
                  color: AppColors.primary,
                  size: 24.w,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
