import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/home/widgets/word_card.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class HomeWordList extends StatelessWidget {
  const HomeWordList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimaryText(
                text: "Latest added words",
                color: AppColors.primaryText,
                fontWeight: FontWeight.w400,
                fontSize: 20,
                fontFamily: 'DmSerifDisplay',
              ),
              ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return WordCard(
                    id: 1,
                    word: 'hello',
                    translation: 'salam',
                    //isLearned: true,
                    onTap: () {
                      //print('${word.id} id-li soz kliklendi');
                    },
                    onBookmarkTap: () {
                      //homeProvider.learnWord(word.id);
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
