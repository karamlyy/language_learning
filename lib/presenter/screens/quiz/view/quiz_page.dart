import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:language_learning/data/model/quiz/question_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/quiz/cubit/quiz_cubit.dart';
import 'package:language_learning/presenter/screens/quiz/provider/quiz_provider.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/asset-paths/app_assets.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit()..getQuizQuestion([]),
      child: ChangeNotifierProvider(
        create: (context) => QuizProvider(),
        child: Scaffold(
          appBar: AppBar(
            title: PrimaryText(
              text: 'Quiz',
              color: AppColors.primaryText,
              fontWeight: FontWeight.w400,
              fontSize: 20,
              fontFamily: 'DMSerifDisplay',
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Consumer<QuizProvider>(
                  builder: (context, quizProvider, child) {
                    return Row(
                      children: List.generate(
                        3,
                        (index) {
                          if (index < quizProvider.chances) {
                            return Icon(
                              CupertinoIcons.heart_fill,
                              color: AppColors.primary,
                              size: 20.w,
                            );
                          } else {
                            return Icon(
                              CupertinoIcons.heart,
                              color: AppColors.primary,
                              size: 20.w,
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          body: BlocListener<QuizCubit, BaseState>(
            listener: (context, state) {},
            child: BlocBuilder<QuizCubit, BaseState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is SuccessState) {
                  final QuestionModel quizData = state.data;
                  return QuizBody(quizData: quizData);
                }
                return Center(child: Text('Failed to load quiz'));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class QuizBody extends StatelessWidget {
  final QuestionModel quizData;

  const QuizBody({
    super.key,
    required this.quizData,
  });

  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<QuizCubit>();
    final quizProvider = context.watch<QuizProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                  color: AppColors.unselectedItemBackground,
                  borderRadius: BorderRadius.circular(24).r),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      text: 'Tap the right answer:',
                      color: AppColors.inputHeading,
                      fontWeight: FontWeight.w600,
                    ),
                    8.verticalSpace,
                    PrimaryText(
                      text: quizData.question,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
            10.verticalSpace,
            Expanded(
              child: ListView.builder(
                itemCount: quizData.answers.length,
                itemBuilder: (context, index) {
                  String answer = quizData.answers.keys.elementAt(index);
                  bool isCorrect = quizData.answers[answer] ?? false;

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                      title: PrimaryText(
                        text: answer,
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      tileColor: AppColors.unselectedItemBackground,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(44.0).r,
                      ),
                      onTap: () {
                        if (isCorrect) {
                          quizProvider.setCorrectAnswerSelected(true);
                        } else {
                          quizProvider.decrementChance();
                        }

                        toastification.show(
                          context: context,
                          closeButtonShowType: CloseButtonShowType.none,
                          icon: isCorrect
                              ? SvgPicture.asset(Images.happyFace,
                                  fit: BoxFit.cover, width: 36.w, height: 36.h)
                              : SvgPicture.asset(Images.sadFace,
                                  fit: BoxFit.cover, width: 36.w, height: 36.h),
                          title: PrimaryText(
                            color:
                                isCorrect ? AppColors.success : AppColors.wrong,
                            fontWeight: FontWeight.w600,
                            text: isCorrect ? 'Correct !' : 'Incorrect',
                            fontSize: 22,
                          ),
                          autoCloseDuration: Duration(seconds: 2),
                          showProgressBar: false,
                          backgroundColor: isCorrect
                              ? AppColors.successBackground
                              : AppColors.wrongBackground,
                          alignment: Alignment.bottomCenter,
                        );

                        if (quizProvider.chances == 0) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: PrimaryText(
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w400,
                                text: 'Finished',
                                fontSize: 20,
                                fontFamily: 'DMSerifDisplay',
                              ),
                              content: PrimaryText(
                                color: AppColors.primaryText
                                    .withValues(alpha: 0.7),
                                fontWeight: FontWeight.w400,
                                text: 'You did 3 mistakes',
                                fontSize: 14,
                              ),
                              actions: [
                                PrimaryButton(
                                  title: 'Restart',
                                  hasBorder: false,
                                  isActive: true,
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    quizProvider.resetChances();
                                    quizCubit.getQuizQuestion([]);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            if (quizProvider.showAddToMaster)
              CupertinoButton(
                pressedOpacity: 1,
                padding: EdgeInsets.zero,
                onPressed: () {
                  quizCubit.addToMaster(quizData.id, quizProvider);
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                  child: Row(
                    children: [
                      PrimaryText(
                        haveUnderline: TextDecoration.underline,
                        text: 'Add to Master words',
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      12.horizontalSpace,
                      Icon(
                        quizProvider.isAddedToMaster
                            ? Icons.bookmark
                            : Icons.bookmark_outline,
                        color: AppColors.primary,
                        size: 20.w,
                      ),
                    ],
                  ),
                ),
              ),
            PrimaryButton(
              title: 'Next',
              hasBorder: false,
              isActive: true ,
              onTap: () {
                quizProvider.setAddToMaster(false);
                quizCubit.getQuizQuestion([]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
