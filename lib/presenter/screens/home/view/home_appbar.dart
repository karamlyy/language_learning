import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
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
            PrimaryText(
              text: 'English - ',
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            PrimaryText(
              text: 'Spanish',
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      color: AppColors.itemBackground,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0).r,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /*
                            List of languages pairs
                             */
                            PrimaryButton(
                              title: 'Change',
                              hasBorder: false,
                              isActive: true,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: AppColors.primaryText,
                size: 24.w,
              ),
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
