import 'package:flutter/material.dart';
import 'package:language_learning/utils/asset-paths/app_assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(Images.splashLogo),
    );
  }
}
