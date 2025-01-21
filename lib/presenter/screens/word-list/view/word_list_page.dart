import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/provider/appbar_provider.dart';
import 'package:language_learning/presenter/screens/word-list/provider/word_list_provider.dart';
import 'package:language_learning/presenter/screens/word-list/view/word_list_body.dart';
import 'package:language_learning/presenter/widgets/primary_button.dart';
import 'package:provider/provider.dart';



class WordListPage extends StatelessWidget {
  const WordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: DividerThemeData(color: Colors.transparent),
      ),
      child: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => AppbarProvider()),
            ChangeNotifierProvider(create: (context) => WordListProvider()),
          ],
          child: const WordListBody(),
        ),
        persistentFooterButtons: [
          Padding(
            padding: const EdgeInsets.all(16.0).r,
            child: PrimaryButton(
              title: 'Lets start the quiz',
              hasBorder: false,
              isActive: true,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
