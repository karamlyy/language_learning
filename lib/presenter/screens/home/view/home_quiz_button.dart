import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/asset-paths/app_assets.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class HomeQuizButton extends StatelessWidget {
  const HomeQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 21.w, vertical: 12.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(Images.quizButtonBackground),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(16).r,
        ),
        child: CupertinoButton(
          padding: EdgeInsets.all(12).r,
          onPressed: () {},
          child: const Center(
            child: PrimaryText(
              text: 'Lets start quiz ',
              color: AppColors.primaryText,
              fontWeight: FontWeight.w400,
              fontSize: 24,
              fontFamily: 'DMSerifDisplay',
            ),
          ),
        ),
      ),
    );
  }
}
