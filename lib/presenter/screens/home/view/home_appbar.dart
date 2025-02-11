import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/cubit/home_cubit.dart';
import 'package:language_learning/presenter/screens/home/provider/home_provider.dart';
import 'package:language_learning/presenter/screens/home/view/home_languages_pairs.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.read<HomeProvider>();

    return BlocBuilder<HomeCubit, BaseState>(
      builder: (context, state) {
        if (state is SuccessState) {
          final selectedPair = homeProvider.selectedLanguagePair ?? homeProvider.getSelectedLanguagePair(state.data);
          final homeCubit = context.read<HomeCubit>();

          return Padding(
            padding: const EdgeInsets.all(8.0).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    PrimaryText(
                      text: selectedPair?.sourceLanguage ?? 'N/A',
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    PrimaryText(
                      text: ' - ${selectedPair?.translationLanguage ?? 'N/A'}',
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return HomeLanguagesPairs(
                              languagePairs: state.data,
                              homeProvider: homeProvider,
                              onLanguagePairSelected: (id) {
                                homeCubit.setSelectedLanguagePair(id);
                              },

                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: AppColors.primaryText,
                        size: 24.w,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.bell),
                  iconSize: 28.w,
                ),
              ],
            ),
          );
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FailureState) {
          return Center(
            child: Text(
              'Failed to load language pairs: ${state.errorMessage}',
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}