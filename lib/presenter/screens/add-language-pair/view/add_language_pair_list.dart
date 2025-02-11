import 'package:flutter/material.dart';
import 'package:language_learning/data/model/home/language_pair_model.dart';
import 'package:language_learning/presenter/screens/home/widgets/word_card.dart';

class AddLanguagePairList extends StatelessWidget {
  final List<LanguagePairModel> languagePairs;

  const AddLanguagePairList({
    super.key,
    required this.languagePairs,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: languagePairs.length,
        itemBuilder: (context, index) {
          final languagePair = languagePairs[index];
          return WordCard(
            id: languagePair.id,
            word: languagePair.sourceLanguage,
            translation: languagePair.translationLanguage,
            onTap: () {},
          );
        },
      ),
    );
  }
}
