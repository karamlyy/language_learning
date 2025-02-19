import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/data/model/home/category_word_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/cubit/home_cubit.dart';
import 'package:language_learning/presenter/screens/word-list/cubit/category_cubit.dart';
import 'package:language_learning/presenter/screens/word-list/provider/word_list_provider.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class WordListPage extends StatelessWidget {
  final List<CategoryWordModel> categoryWords;

  const WordListPage({
    super.key,
    required this.categoryWords,
  });

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: PrimaryText(
            color: AppColors.primaryText,
            fontWeight: FontWeight.w400,
            text: 'Category Vocabulary',
            fontFamily: 'DMSerifDisplay',
            fontSize: 20,
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => WordListProvider(),
          child: BlocListener<CategoryCubit, BaseState>(
            listener: (context, state) {},
            child: Padding(
              padding: const EdgeInsets.all(16.0).r,
              child: ListView.builder(
                itemCount: categoryWords.length,
                itemBuilder: (context, index) {
                  final categoryWord = categoryWords[index];
                  final wordListProvider = context.watch<WordListProvider>();
                  final categoryCubit = context.read<CategoryCubit>();
                  final currentStatus = wordListProvider.getBookmarkStatus(
                    categoryWord.id,
                    categoryWord.isAdded,
                  );

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.w,
                      vertical: 5.h,
                    ),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
                      tileColor: AppColors.unselectedItemBackground,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24).r,
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          wordListProvider.toggleBookmarkStatus(
                            categoryWord.id,
                            currentStatus,
                          );
                          await categoryCubit.changeWordStatus(categoryWord.id);
                          homeCubit.getCardCounts();
                          homeCubit.getAllLanguagePairs();
                        },
                        icon: Icon(
                          currentStatus
                              ? Icons.bookmark
                              : Icons.bookmark_outline,
                          color: AppColors.bookMarkBackground,
                          size: 20.w,
                        ),
                      ),
                      title: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.primaryText,
                          ),
                          children: [
                            TextSpan(
                              text: categoryWord.source,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: ' - ${categoryWord.translation}',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
