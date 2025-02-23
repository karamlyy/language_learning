import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/asset-paths/app_assets.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:language_learning/presenter/screens/home/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeQuizButton extends StatelessWidget {
  const HomeQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return StreamBuilder(
      stream: homeCubit.countController,
      builder: (context, snapshot) {
        final learningCount = snapshot.data?.learningCount ?? 0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 12.h),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(Images.quizButtonBackground),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(16).r,
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),

            ),
            child: CupertinoButton(
              padding: EdgeInsets.all(12).r,
              onPressed: () {
                if (learningCount == 0) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const PrimaryText(
                        text: "Notice",
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        fontFamily: 'DMSerifDisplay',
                      ),
                      content: const PrimaryText(
                        text:
                        "There are no learning words available to start the quiz.",
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w400,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                } else {
                  Navigation.push(Routes.quiz);
                }
              },
              child: Center(
                child: PrimaryText(
                  text: 'Let’s start quiz',
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  fontFamily: 'DMSerifDisplay',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


class HomeMasterQuizButton extends StatelessWidget {
  const HomeMasterQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return StreamBuilder(
      stream: homeCubit.countController,
      builder: (context, snapshot) {
        final learningCount = snapshot.data?.learningCount ?? 0;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 12.h),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(Images.quizButtonBackground),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(16).r,
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),

            ),
            child: CupertinoButton(
              padding: EdgeInsets.all(12).r,
              onPressed: () {
                if (learningCount == 0) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const PrimaryText(
                        text: "Notice",
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        fontFamily: 'DMSerifDisplay',
                      ),
                      content: const PrimaryText(
                        text:
                        "There are no mastered words available to start the quiz.",
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w400,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                } else {
                  Navigation.push(Routes.masterQuiz);
                }
              },
              child: Center(
                child: PrimaryText(
                  text: 'Mastered Quiz',
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  fontFamily: 'DMSerifDisplay',
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
