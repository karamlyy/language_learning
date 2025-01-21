import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/new-word/view/new_word_button.dart';
import 'package:language_learning/presenter/screens/new-word/view/new_word_inputs.dart';
import 'package:language_learning/presenter/widgets/primary_appbar.dart';

class NewWordBody extends StatelessWidget {
  const NewWordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          PrimaryAppbar(title: 'New Word'),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NewWordInputs(),
                NewWordButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
