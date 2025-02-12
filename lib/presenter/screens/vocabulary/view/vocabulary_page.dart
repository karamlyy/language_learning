import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/generic/base_state.dart';
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
      create: (context) => VocabularyCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.search,
                size: 15.w,
              ),
            ),
          ],
          title: PrimaryText(
            text: 'Vocabulary',
            color: AppColors.primaryText,
            fontWeight: FontWeight.w400,
            fontFamily: 'DMSerifDisplay',
            fontSize: 20,
          ),
        ),
        body: BlocListener<VocabularyCubit, BaseState>(
          listener: (context, state) {},
          child: VocabularyWordsBody(),
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
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.w,
                        vertical: 5.h,
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(12).r,
                        tileColor: AppColors.unselectedItemBackground,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24).r,
                          borderSide: BorderSide(color: Colors.transparent)
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            vocabularyCubit.addToLearning(word.id);
                          },
                          icon: Icon(
                            word.isLearningNow == true ? Icons.bookmark : Icons.bookmark_outline,
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
