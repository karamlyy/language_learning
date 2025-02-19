import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/cubit/home_cubit.dart';
import 'package:language_learning/presenter/screens/vocabulary/cubit/vocabulary_cubit.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class VocabularyWordsList extends StatelessWidget {
  const VocabularyWordsList({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return BlocBuilder<VocabularyCubit, BaseState>(
      builder: (context, state) {
        if (state is SuccessState) {
          final data = state.data;
          return ListView.builder(
            itemCount: data.items.length,
            itemBuilder: (context, index) {
              final vocabularyCubit = context.read<VocabularyCubit>();
              final word = data.items[index];

              return BlocBuilder<VocabularyCubit, BaseState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.w,
                        vertical: 5.h,
                      ),
                      child: Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26.r),
                            color: AppColors.error,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Icon(
                                  CupertinoIcons.delete,
                                  color: AppColors.itemBackground,
                                  size: 20.w,
                                ),
                              )
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            vocabularyCubit.deleteWord(word.id);
                          }
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.all(12).r,
                          tileColor: AppColors.unselectedItemBackground,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24).r,
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              await vocabularyCubit.addToLearning(word.id);
                              homeCubit.getLastWords();
                              homeCubit.getCardCounts();
                            },
                            icon: Icon(
                              word.isLearningNow == true
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              size: 20.w,
                              color: AppColors.bookMarkBackground,
                            ),
                          ),
                          title: PrimaryText(
                            text: '${word.source} - ${word.translation}',
                            fontSize: 16,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Text('xeta');
                  }
                },
              );
            },
          );
        } else {
          return Center(child: Text('yuklenir'));
        }
      },
    );
  }
}
