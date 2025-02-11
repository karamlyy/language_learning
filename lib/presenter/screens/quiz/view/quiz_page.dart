import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/data/model/quiz/question_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/quiz/cubit/quiz_cubit.dart';
import 'package:language_learning/presenter/screens/quiz/provider/quiz_provider.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
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
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.heart_fill,
                      color: AppColors.primary,
                      size: 20.w,
                    ),
                    Icon(
                      CupertinoIcons.heart_fill,
                      color: AppColors.primary,
                      size: 20.w,
                    ),
                    Icon(
                      CupertinoIcons.heart,
                      color: AppColors.primary,
                      size: 20.w,
                    ),
                  ],
                ),
              )
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
    final quizProvider = context.read<QuizProvider>();

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
                borderRadius: BorderRadius.circular(24).r,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 12.w,
                ),
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
                        if (!isCorrect) {
                          quizProvider.decrementChance();
                        }

                        toastification.show(
                          context: context,
                          icon:
                              isCorrect ? Icon(Icons.check) : Icon(Icons.close),
                          title: Text(
                            isCorrect ? 'Correct :)' : 'Incorrect :( $answer',
                            style: TextStyle(
                              color: isCorrect
                                  ? AppColors.success
                                  : AppColors.wrong,
                            ),
                          ),
                          autoCloseDuration: Duration(seconds: 2),
                          showProgressBar: false,
                          backgroundColor: isCorrect
                              ? AppColors.successBackground
                              : AppColors.wrongBackground,
                          alignment: Alignment.topCenter,
                          type: isCorrect
                              ? ToastificationType.success
                              : ToastificationType.error,
                        );

                        if (quizProvider.chances == 0) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Quiz bitdi'),
                              content: Text('3 defe sehv etdiniz.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    quizProvider.resetChances();
                                    quizCubit.getQuizQuestion([]);
                                  },
                                  child: Text('yeniden basla'),
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
            PrimaryButton(
              title: 'Next',
              hasBorder: false,
              isActive: true,
              onTap: () {
                quizCubit.getQuizQuestion([]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
