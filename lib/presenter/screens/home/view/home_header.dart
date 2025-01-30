import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/home/provider/home_provider.dart';
import 'package:language_learning/presenter/screens/home/widgets/vocabulary_card.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return Padding(
      padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 12.w),
      child: SizedBox(
        height: 115.h,
        child: ListView.builder(
          itemCount: homeProvider.wordGroups.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final wordGroup = homeProvider.wordGroups[index];
            return VocabularyCard(
              groupName: wordGroup.groupName,
              allWords: wordGroup.allWords,
              masteredWords: wordGroup.masteredWords,
              icon: wordGroup.icon,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
