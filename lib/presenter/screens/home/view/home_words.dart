import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/data/model/home/user_vocabulary_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/cubit/home_cubit.dart';
import 'package:language_learning/presenter/screens/home/provider/home_provider.dart';
import 'package:language_learning/presenter/screens/home/widgets/word_card.dart';
import 'package:provider/provider.dart';

class HomeWords extends StatelessWidget {
  const HomeWords({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getLastWords(),
      child: ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        child: BlocListener<HomeCubit, BaseState>(
          listener: (context, state) {},
          child: HomeWordsList(),
        ),
      ),
    );
  }
}

class HomeWordsList extends StatelessWidget {
  const HomeWordsList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserVocabularyModel>(
      stream: context.read<HomeCubit>().lastWordsController,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(16.0).r,
            child: SizedBox(
              height: 1000,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data?.items.length,
                itemBuilder: (context, index) {
                  final wordPair = snapshot.data?.items[index];

                  return WordCard(
                    id: wordPair?.id,
                    word: wordPair?.source,
                    translation: wordPair?.translation,
                    isAdded: wordPair?.isLearningNow,
                    //onTap: () {},
                    //onBookmarkTap: () {},
                  );
                },
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
