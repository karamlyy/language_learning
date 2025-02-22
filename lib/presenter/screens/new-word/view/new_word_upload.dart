import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/screens/new-word/cubit/new_word_cubit.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';

class NewWordUpload extends StatelessWidget {
  const NewWordUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewWordCubit, BaseState>(
      listener: (context, state) {
        if (state is FailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errorMessage}')),
          );
        } else if (state is SuccessState) {
          final filePath = state.data;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('File saved at: $filePath')),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Center(
          child: PrimaryButton(
            title: 'Download Template',
            hasBorder: true,
            isActive: true,
            onTap: () {
              context.read<NewWordCubit>().downloadTemplate("https://drive.google.com/file/d/1xP-DGUPnLoS1NgybAL4WuI87IQ9fkzKt/view");
            },
          ),
        );
      },
    );
  }
}
