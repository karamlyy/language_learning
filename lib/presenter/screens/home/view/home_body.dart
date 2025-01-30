import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/data/model/home/category_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/cubit/home_cubit.dart';
import 'package:language_learning/presenter/screens/home/provider/home_provider.dart';
import 'package:language_learning/presenter/screens/home/widgets/vocabulary_card.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return BlocBuilder<HomeCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const CircularProgressIndicator();
        } else if (state is SuccessState) {
          final categories = state.data as List<CategoryModel>;
          return SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: EdgeInsets.all(16.0).r,
                                child: Row(
                                  children: List.generate(
                                    categories.length,
                                    (index) {
                                      final category = categories[index];
                                      return VocabularyCard(
                                        groupName: category.name,
                                        allWords: category.vocabularyCount,
                                        masteredWords: category.masteredCount,
                                        onTap: () {},
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        } else if (state is FailureState) {
          return Center(child: Text('Failed to load languages'));
        } else {
          return Center(child: Text('Initializing...'));
        }
      },
    );
  }
}
