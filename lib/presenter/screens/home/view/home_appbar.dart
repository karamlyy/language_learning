import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/data/model/home/language_pair_model.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/cubit/home_cubit.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:language_learning/presenter/widgets/primary_text.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, BaseState>(
      builder: (context, state) {
        final homeCubit = context.read<HomeCubit>();
        final selectedLanguagePair = homeCubit.selectedLanguagePair;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                PrimaryText(
                  text: selectedLanguagePair?.sourceLanguage ?? 'English',
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                PrimaryText(
                  text: ' - ${selectedLanguagePair?.translationLanguage ?? 'Spanish'}',
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                IconButton(
                  onPressed: () {
                    homeCubit.getAllLanguagePairs();
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return BlocBuilder<HomeCubit, BaseState>(
                          builder: (context, state) {
                            if (state is LoadingState) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (state is SuccessState) {
                              return Container(
                                color: AppColors.itemBackground,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0).r,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: homeCubit.languagePairs.length,
                                          itemBuilder: (context, index) {
                                            final pair = homeCubit.languagePairs[index];
                                            return ListTile(
                                              title: Text('${pair.sourceLanguage} - ${pair.translationLanguage}'),
                                              trailing: pair.isSelected ? const Icon(Icons.check) : null,
                                              onTap: () {
                                                homeCubit.setSelectedLanguagePair(pair);
                                                Navigator.pop(context);
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      PrimaryButton(
                                        title: 'Change',
                                        hasBorder: false,
                                        isActive: true,
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else if (state is FailureState) {
                              return Center(child: Text('Failed to load language pairs: ${state.errorMessage}'));
                            } else {
                              return const Center(child: Text('Initializing...'));
                            }
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
        );
      },
    );
  }
}