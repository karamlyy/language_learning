import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/widgets/word_card.dart';
import 'package:language_learning/presenter/screens/vocabulary/cubit/vocabulary_cubit.dart';
import 'package:language_learning/presenter/screens/vocabulary/provider/vocabulary_provider.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';

class VocabularyPage extends StatelessWidget {
  const VocabularyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VocabularyCubit()..getAllWords(),
      child: Scaffold(
        appBar: AppBar(
          title: PrimaryText(
            text: 'Vocabulary',
            color: AppColors.primaryText,
            fontWeight: FontWeight.w400,
            fontFamily: 'DMSerifDisplay',
            fontSize: 20,
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => VocabularyProvider(),
          child: BlocListener<VocabularyCubit, BaseState>(
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
          return const CircularProgressIndicator();
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
    return BlocBuilder<VocabularyCubit, BaseState>(
      builder: (context, state) {
        if (state is SuccessState) {
          final data = state.data;
          return ListView.builder(
            itemCount: data.items.length,
            itemBuilder: (context, index) {
              final vocabularyCubit = context.read<VocabularyCubit>();
              final word = data.items[index];

              return BlocBuilder<VocabularyCubit, BaseState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    return WordCard(
                      word: word.source,
                      translation: word.translation,
                      onBookmarkTap: () async {
                        print(word.id);
                        vocabularyCubit.addToLearning(word.id);
                      },
                    );
                  } else {
                    return Text('xeta');
                  }
                },
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

/*
class VocabularyWordsList extends StatelessWidget {
  const VocabularyWordsList({super.key});

  @override
  Widget build(BuildContext context) {
    final vocabularyCubit = context.watch<VocabularyCubit>();
    final state = vocabularyCubit.state as List<WordPairModel>;

    if (state is SuccessState) {
      return ListView.builder(
        itemCount: state.length,
        itemBuilder: (context, index) {
          final word = state[index];

          return BlocBuilder<VocabularyCubit, BaseState>(
            builder: (context, state) {
              if (state is SuccessState) {
                return WordCard(
                  word: word.source,
                  translation: word.translation,
                  onBookmarkTap: () async {
                    vocabularyCubit.addToLearning(word.id);
                  },
                  isAdded: word.isLearning,
                );
              } else {
                return Text('xeta');
              }
            },
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

 */
