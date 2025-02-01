import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/home/widgets/word_card.dart';
import 'package:language_learning/presenter/screens/word-list/provider/word_list_provider.dart';
import 'package:provider/provider.dart';

class WordListMain extends StatelessWidget {
  const WordListMain({super.key});

  @override
  Widget build(BuildContext context) {
    final wordListProvider = context.watch<WordListProvider>();

    return Expanded(
      child: ListView.builder(
        itemCount: wordListProvider.words.length,
        itemBuilder: (BuildContext context, int index) {
          final word = wordListProvider.words[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
            child: WordCard(
              id: word.id,
              word: word.word,
              translation: word.translation,
              //isLearned: word.isLearned,
              onTap: () {},
              onBookmarkTap: () {},
            ),
          );
        },
      ),
    );
  }
}
