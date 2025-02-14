import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/data/model/home/category_word_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/cubit/home_cubit.dart';
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
    return BlocProvider(
      create: (context) => HomeCubit(),
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
          child: BlocListener<HomeCubit, BaseState>(
            listener: (context, state) {},
            child: Padding(
              padding: const EdgeInsets.all(16.0).r,
              child: ListView.builder(
                itemCount: categoryWords.length,
                itemBuilder: (context, index) {
                  final categoryWord = categoryWords[index];
                  final categoryProvider = context.watch<WordListProvider>();
                  final categoryCubit = context.read<HomeCubit>();
                  return BlocBuilder<HomeCubit, BaseState>(
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.w,
                          vertical: 5.h,
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(12).r,
                          tileColor: AppColors.unselectedItemBackground,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24).r,
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              categoryCubit.changeWordStatus(categoryWord.id);
                            },
                            icon: Icon(
                              categoryWord.isAdded
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: AppColors.bookMarkBackground,
                              size: 20.w,
                            ),
                          ),
                          title: PrimaryText(
                            text:
                                '${categoryWord.source} - ${categoryWord.translation}',
                            fontSize: 16,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
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
