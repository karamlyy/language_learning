import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/cubit/home_cubit.dart';
import 'package:language_learning/presenter/screens/vocabulary/cubit/vocabulary_cubit.dart';
import 'package:language_learning/presenter/screens/vocabulary/provider/vocabulary_provider.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:provider/provider.dart';

class VocabularyPage extends StatelessWidget {
  const VocabularyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VocabularyCubit(),
      child: ChangeNotifierProvider(
        create: (context) => VocabularyProvider(),
        child: Scaffold(
          appBar: AppBar(
            leading: Consumer<VocabularyProvider>(
              builder: (context, provider, child) {
                return Visibility(
                  visible: true,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.primaryText),
                    onPressed: provider.isSearchActive
                        ? provider.toggleSearch
                        : Navigation.pop,
                  ),
                );
              },
            ),
            title: Consumer<VocabularyProvider>(
              builder: (context, provider, child) {
                final vocabularyCubit = context.watch<VocabularyCubit>();

                return provider.isSearchActive
                    ? TextField(
                        controller: provider.searchController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primaryText,
                        ),
                        onChanged: (query) {
                          provider.onSearchChanged(query, (word) {
                            vocabularyCubit.searchWord(word);
                          });
                        },
                      )
                    : PrimaryText(
                        text: 'Vocabulary',
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSerifDisplay',
                        fontSize: 20,
                      );
              },
            ),
            actions: [
              Consumer<VocabularyProvider>(
                builder: (context, provider, child) {
                  return provider.isSearchActive
                      ? TextButton(
                          onPressed: () {
                            provider.clearSearch();
                            context.read<VocabularyCubit>().getAllWords();
                          },
                          child: PrimaryText(
                            text: 'clear',
                            color: AppColors.primaryText.withValues(alpha: 0.7),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.search,
                            color: AppColors.primaryText,
                            size: 20.w,
                          ),
                          onPressed: provider.toggleSearch,
                        );
                },
              ),
            ],
          ),
          body: BlocListener<VocabularyCubit, BaseState>(
            listener: (context, state) {},
            child: VocabularyWordsBody(),
          ),
        ),
      ),
    );
  }
}

class VocabularyWordsBody extends StatelessWidget {
  const VocabularyWordsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VocabularyCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: const CircularProgressIndicator(),
          );
        } else if (state is SuccessState) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0).r,
              child: VocabularyWordsList(),
            ),
          );
        } else if (state is FailureState) {
          return Center(
            child: Text(
              'Failed to load home data: ${state.errorMessage}',
            ),
          );
        } else {
          return const Center(child: Text('Initializing...'));
        }
      },
    );
  }
}

class VocabularyWordsList extends StatelessWidget {
  const VocabularyWordsList({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return BlocBuilder<VocabularyCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessState) {
          final data = state.data;
          return ListView.builder(
            itemCount: data.items.length,
            itemBuilder: (context, index) {
              final vocabularyCubit = context.read<VocabularyCubit>();
              final word = data.items[index];

              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.w,
                  vertical: 5.h,
                ),
                child: Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.r),
                      color: AppColors.error,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: Icon(
                            CupertinoIcons.delete,
                            color: AppColors.itemBackground,
                            size: 20.w,
                          ),
                        )
                      ],
                    ),
                  ),
                  onDismissed: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      await vocabularyCubit.deleteWord(word.id);
                      homeCubit.getLastWords();
                      homeCubit.getCardCounts();
                    }
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h,),
                    tileColor: AppColors.unselectedItemBackground,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24).r,
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    trailing: IconButton(
                      onPressed: () async {
                        await vocabularyCubit.addToLearning(word.id);
                        homeCubit.getLastWords();
                        homeCubit.getCardCounts();
                        },
                      icon: Icon(
                        word.isLearningNow
                            ? Icons.bookmark
                            : Icons.bookmark_outline,
                        size: 20.w,
                        color: AppColors.bookMarkBackground,
                      ),
                    ),
                    title: PrimaryText(
                      text: '${word.source} - ${word.translation}',
                      fontSize: 16,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: Text('Loading...'));
        }
      },
    );
  }
}
