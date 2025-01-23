import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/home/provider/home_provider.dart';
import 'package:language_learning/presenter/screens/home/widgets/vocabulary_card.dart';
import 'package:language_learning/presenter/screens/home/widgets/word_card.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/presenter/widgets/secondary_floating_bottom_navbar.dart';
import 'package:language_learning/utils/asset-paths/app_assets.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      pinned: true,
                      automaticallyImplyLeading: false,
                      forceMaterialTransparency: false,
                      backgroundColor: AppColors.background,
                      collapsedHeight: 50.h,
                      expandedHeight: 50.h,
                      toolbarHeight: 50.h,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: PrimaryText(
                                  text: 'Change language',
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColors.primary,
                                size: 24.w,
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(CupertinoIcons.bell),
                            iconSize: 28.w,
                          )
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.all(16.0).r,
                          child: Row(
                            children: List.generate(homeProvider.wordGroups.length,
                                (index) {
                              final wordGroup = homeProvider.wordGroups[index];
                              return VocabularyCard(
                                groupName: wordGroup.groupName,
                                allWords: wordGroup.allWords,
                                masteredWords: wordGroup.masteredWords,
                                icon: wordGroup.icon,
                                onTap: () {
                                  Navigation.push(Routes.wordList);
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 21.w, vertical: 12.h),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(Images.quizButtonBackground),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(16).r,
                          ),
                          child: CupertinoButton(
                            padding: EdgeInsets.all(12).r,
                            onPressed: () {},
                            child: const Center(
                              child: PrimaryText(
                                text: 'Lets start quiz ',
                                color: AppColors.primaryText,
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                                fontFamily: 'DMSerifDisplay',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 12.h),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){

                                        Navigation.push(Routes.vocabulary);
                                      },
                                      child: Container(

                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              const Radius.circular(16).r),
                                          color: AppColors.unselectedItemBackground,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w, vertical: 10.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                PrimaryText(
                                                  text: '120',
                                                  color: AppColors.primary,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 36,
                                                  fontFamily: 'DMSerifDisplay',
                                                ),
                                                PrimaryText(
                                                  text: 'Vocabulary',
                                                  color: AppColors.primaryText
                                                      .withValues(alpha: 0.8),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    12.verticalSpace,
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(16).r),
                                        color: AppColors.unselectedItemBackground,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0,
                                            vertical: 10.0,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              PrimaryText(
                                                text: '17',
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 36,
                                                fontFamily: 'DMSerifDisplay',
                                              ),
                                              PrimaryText(
                                                text: 'Learning now',
                                                color: AppColors.primaryText
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              12.horizontalSpace,
                              Expanded(

                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16).r),
                                    color: AppColors.unselectedItemBackground,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          PrimaryText(
                                            text: '24',
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 36,
                                            fontFamily: 'DMSerifDisplay',
                                          ),
                                          PrimaryText(
                                            text: 'Mastered Words',
                                            color: AppColors.primaryText
                                                .withOpacity(0.8),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16).r,
                        child: PrimaryText(
                          text: 'Latest added words',
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w400,
                          fontSize: 26,
                          fontFamily: 'DMSerifDisplay',
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final word = homeProvider.words[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: WordCard(
                              id: word.id,
                              word: word.word,
                              translation: word.translation,
                              isLearned: word.isLearned,
                              onTap: () {
                                print('${word.id} id-li soz kliklendi');
                              },
                              onBookmarkTap: () {
                                homeProvider.learnWord(word.id);
                              },
                            ),
                          );
                        },
                        childCount: homeProvider.words.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.0).r,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SecondaryFloatingBottomNavbar(),
            ),
          ),
        ],
      ),
    );
  }
}
