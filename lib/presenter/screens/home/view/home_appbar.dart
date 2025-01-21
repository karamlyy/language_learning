import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.r, right: 16.r, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.all(0.0).r)),
            onPressed: () {},
            label: PrimaryText(
              text: 'Change language',
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: AppColors.primary,
            ),
            iconAlignment: IconAlignment.end,
          ),
          Icon(
            CupertinoIcons.bell_solid,
            size: 28.h,
          ),
        ],
      ),
    );
  }
}
