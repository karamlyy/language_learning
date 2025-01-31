import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: PrimaryText(
                text: 'Change language',
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: AppColors.primary,
              size: 24.w,
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.bell),
          iconSize: 28.w,
        )
      ],
    );
  }
}
