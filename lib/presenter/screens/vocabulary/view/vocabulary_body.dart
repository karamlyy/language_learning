import 'package:flutter/cupertino.dart';
import 'package:language_learning/presenter/screens/vocabulary/view/vocabulary_main.dart';

class VocabularyBody extends StatelessWidget {
  const VocabularyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          VocabularyMain(),
        ],
      ),
    );
  }
}
