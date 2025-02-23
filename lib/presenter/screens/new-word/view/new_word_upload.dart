import 'dart:io';
import 'package:file_picker/file_picker.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('File uploaded successfully!')),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: PrimaryButton(
            title: 'Select & Upload File',
            hasBorder: true,
            isActive: true,
            onTap: () {},
          ),
        );
      },
    );
  }
}
