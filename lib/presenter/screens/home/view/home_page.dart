import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

import 'home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: DividerThemeData(color: Colors.transparent),
        scaffoldBackgroundColor: Colors.white,
      ),
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => HomeProvider(),
          child: const HomeBody(),
        ),
      ),
    );
  }
}

