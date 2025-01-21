import 'package:flutter/material.dart';
import 'package:language_learning/presenter/screens/auth/timing/provider/timing_provider.dart';
import 'package:language_learning/presenter/screens/auth/timing/view/timing_body.dart';
import 'package:provider/provider.dart';

class TimingPage extends StatelessWidget {
  const TimingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => TimingProvider(),
        child: const TimingBody(),
      ),
    );
  }
}
