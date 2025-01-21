import 'package:flutter/material.dart';
import 'package:language_learning/presenter/provider/appbar_provider.dart';
import 'package:language_learning/presenter/screens/new-word/provider/new_word_provider.dart';
import 'package:provider/provider.dart';

import 'new_word_body.dart';

class NewWordPage extends StatelessWidget {
  const NewWordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AppbarProvider()),
          ChangeNotifierProvider(create: (context) => NewWordProvider()),
        ],
        child: const NewWordBody(),
      ),
    );
  }
}
