import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/new-word/view/new_word_button.dart';
import 'package:language_learning/presenter/screens/new-word/view/new_word_inputs.dart';

class NewWordBody extends StatelessWidget {
  const NewWordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                NewWordInputs(),
              ],
            ),
          ),
          NewWordButton(),
        ],
      ),
    );
  }
}