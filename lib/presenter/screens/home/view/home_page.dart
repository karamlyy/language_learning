import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/home/cubit/home_cubit.dart';
import 'package:language_learning/presenter/screens/home/provider/home_provider.dart';
import 'package:language_learning/presenter/screens/home/view/home_body.dart';
import 'package:language_learning/presenter/widgets/primary_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) {
            final homeProvider = HomeProvider();
            homeProvider.setUserId();
            return homeProvider;
          },
          child: BlocListener<HomeCubit, BaseState>(
            listener: (context, state) {
              if (state is SuccessState) {
                print('Categories fetched successfully');
              } else if (state is FailureState) {
                PrimaryBottomSheet.show(
                  context,
                  text: 'Failed to fetch categories: ${state.errorMessage}',
                );
              }
            },
            child: HomeBody(),
          ),
        ),
      ),
    );
  }
}