import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/data/model/home/category_model.dart';
import 'package:language_learning/data/model/home/user_vocabulary_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/cubit/home_cubit.dart';
import 'package:language_learning/presenter/screens/home/provider/home_provider.dart';
import 'package:language_learning/presenter/screens/home/view/home_appbar.dart';
import 'package:language_learning/presenter/screens/home/view/home_quiz_button.dart';
import 'package:language_learning/presenter/screens/home/widgets/catergory_card.dart';
import 'package:language_learning/presenter/screens/home/widgets/list_card.dart';
import 'package:language_learning/presenter/screens/home/widgets/word_card.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/presenter/widgets/secondary_floating_bottom_navbar.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return BlocBuilder<HomeCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessState) {
          final data = state.data as Map<String, dynamic>;
          final categories = data["categories"] as List<CategoryModel>;
          final wordPairs = data["words"] as UserVocabularyModel;

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
                            backgroundColor: AppColors.background,
                            collapsedHeight: 50.h,
                            expandedHeight: 50.h,
                            toolbarHeight: 50.h,
                            title: HomeAppbar(),
                          ),

                          // Categories List
                          SliverToBoxAdapter(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: EdgeInsets.all(16.0).r,
                                child: Row(
                                  children: categories.map((category) {
                                    return CategoryCard(
                                      id: category.id,
                                      groupName: category.name,
                                      allWords: category.vocabularyCount,
                                      masteredWords: category.masteredCount,
                                      onTap: () {},
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),

                          SliverToBoxAdapter(
                            child: HomeQuizButton(),
                          ),

                          SliverToBoxAdapter(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: EdgeInsets.all(16.0).r,
                                child: Row(
                                  children: List.generate(
                                    homeProvider.lists.length,
                                        (index) {
                                      final list = homeProvider.lists[index];
                                      return ListCard(
                                        id: list.id,
                                        listName: list.listName,
                                        isActive: list.isActive,
                                        onTap: list.onTap,
                                      );
                                    },
                                  ),
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

                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.all(16.0).r,
                              child: Column(
                                children: wordPairs.items.map((wordPair) {
                                  return WordCard(
                                    id: wordPair.id,
                                    word: wordPair.source,
                                    translation: wordPair.translation,
                                    onTap: () {},
                                    onBookmarkTap: () {},
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0).r,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SecondaryFloatingBottomNavbar(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else if (state is FailureState) {
          return Center(child: Text('Failed to load home data: ${state.errorMessage}'));
        } else {
          return const Center(child: Text('Initializing...'));
        }
      },
    );
  }
}
