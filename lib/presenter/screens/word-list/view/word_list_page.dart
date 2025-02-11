import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/data/model/home/category_word_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/widgets/word_card.dart';
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
              child: Expanded(
                child: ListView.builder(
                  itemCount: categoryWords.length,
                  itemBuilder: (context, index) {
                    final categoryWord = categoryWords[index];
                    final categoryProvider = context.watch<WordListProvider>();
                    final categoryCubit = context.read<CategoryCubit>();
                    return BlocBuilder<CategoryCubit, BaseState>(
                      builder: (context, state) {
                        return WordCard(
                          word: categoryWord.source,
                          translation: categoryWord.translation,
                          onBookmarkTap: () {
                            categoryCubit.changeWordStatus(categoryProvider.categoryWordInput ?? 1);
                          },

                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
