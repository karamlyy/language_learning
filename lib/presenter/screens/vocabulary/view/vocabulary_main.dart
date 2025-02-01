import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/home/widgets/word_card.dart';
import 'package:language_learning/presenter/screens/vocabulary/provider/vocabulary_provider.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:provider/provider.dart';

class VocabularyMain extends StatelessWidget {
  const VocabularyMain({super.key});

  @override
  Widget build(BuildContext context) {
    final vocabularyProvider = context.watch<VocabularyProvider>();

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: vocabularyProvider.filteredWords.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PrimaryText(
                    text: 'No Result Found',
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    fontFamily: 'DMSerifDisplay',
                    textAlign: TextAlign.center,
                  ),
                  PrimaryText(
                    text:
                        'Sorry, we could not find what you are looking for. Add a new word to your list!',
                    color: AppColors.primaryText.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : ListView.builder(
                itemCount: vocabularyProvider.filteredWords.length,
                itemBuilder: (BuildContext context, int index) {
                  final word = vocabularyProvider.filteredWords[index];
                  return WordCard(
                    id: word.id,
                    word: word.word,
                    translation: word.translation,

                    onTap: () {
                      Navigation.push(Routes.newWord);
                    },
                    onBookmarkTap: () {
                      vocabularyProvider.learnWord(word.id);
                    },
                  );
                },
              ),
      ),
    );
  }
}
