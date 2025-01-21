import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/auth/languages/provider/languages_provider.dart';
import 'package:language_learning/presenter/screens/auth/languages/view/set_language_body.dart';
import 'package:provider/provider.dart';

class SetLanguagePage extends StatelessWidget {
  const SetLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguagesProvider(),
      child: const Scaffold(
        body: SetLanguageBody(),
      ),
    );
  }
}
