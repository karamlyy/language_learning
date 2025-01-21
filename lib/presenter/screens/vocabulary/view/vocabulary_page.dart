import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/vocabulary/provider/vocabulary_provider.dart';
import 'package:language_learning/presenter/screens/vocabulary/view/vocabulary_body.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:provider/provider.dart';

class VocabularyPage extends StatelessWidget {
  const VocabularyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VocabularyProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          title: Builder(
            builder: (context) {
              final vocabularyProvider = context.watch<VocabularyProvider>();
              return vocabularyProvider.isSearchActive
                  ? AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: vocabularyProvider.isSearchActive
                          ? double.infinity
                          : 0,
                      child: TextField(
                        onChanged: (query) {
                          vocabularyProvider.searchWord(query);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: TextStyle(fontSize: 14.sp),
                          filled: true,
                          fillColor: AppColors.cardBackground,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(12.r),
                          suffix: TextButton(
                            onPressed: () {
                              vocabularyProvider.searchWord('');
                            },
                            child: Text(
                              'clear',
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 14.sp,
                        ),
                      ),
                    )
                  : const PrimaryText(
                      text: 'Vocabulary',
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSerifDisplay',
                      fontSize: 20,
                    );
            },
          ),
          actions: [
            Builder(
              builder: (context) {
                final vocabularyProvider = context.watch<VocabularyProvider>();
                return IconButton(
                  onPressed: () {
                    vocabularyProvider.toggleSearch();
                  },
                  icon: Icon(
                    vocabularyProvider.isSearchActive
                        ? Icons.close
                        : CupertinoIcons.search,
                    size: 20.w,
                  ),
                );
              },
            ),
          ],
        ),
        body: const VocabularyBody(),
        persistentFooterButtons: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.w),
            child: PrimaryButton(
              title: 'add new word',
              hasBorder: false,
              isActive: true,
              onTap: () {
                Navigation.push(Routes.newWord);
              },
            ),
          ),
        ],
      ),
    );
  }
}
