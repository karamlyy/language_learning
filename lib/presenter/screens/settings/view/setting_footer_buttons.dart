import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/generic/generic_builder.dart';
import 'package:language_learning/presenter/screens/settings/cubit/settings_cubit.dart';
import 'package:language_learning/presenter/screens/settings/settings_options.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:language_learning/presenter/widgets/settings_card.dart';
import 'package:language_learning/utils/colors/app_colors.dart';

class SettingsFooterButtons extends StatelessWidget {
  const SettingsFooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCubit = context.read<SettingsCubit>();
    return GenericBuilder<SettingsCubit, BaseState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const CircularProgressIndicator();
        }
        return Column(
          children: [
            SettingsCard(
              title: SettingsOption.deleteAccount.title,
              trailingIcon: Icon(SettingsOption.deleteAccount.icon),
              iconColor: AppColors.hintText,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("hesab silinme"),
                      content: Text("silmeye eminsen?"),
                      actions: [
                        PrimaryButton(
                          title: 'he',
                          hasBorder: false,
                          isActive: true,
                          onTap: () {
                            settingsCubit.deleteUser();
                          },
                        ),
                        PrimaryButton(
                          title: 'xeyr',
                          hasBorder: true,
                          isActive: true,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      elevation: 24,
                    );
                  },
                );
              },
            ),
            SettingsCard(
              title: SettingsOption.logout.title,
              trailingIcon: Icon(SettingsOption.logout.icon),
              iconColor: AppColors.error,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("hesabdan cixirsan"),
                      content: Text("eminsen?"),
                      actions: [
                        PrimaryButton(
                          title: 'he',
                          hasBorder: false,
                          isActive: true,
                          onTap: () {
                            settingsCubit.logoutUser();
                          },
                        ),
                        PrimaryButton(
                          title: 'xeyr',
                          hasBorder: true,
                          isActive: true,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      elevation: 24,
                    );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}