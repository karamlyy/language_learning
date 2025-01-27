import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/widgets/settings_card.dart';

class SettingsMain extends StatelessWidget {
  const SettingsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6.w,
            vertical: 5.h,
          ),
          child: SettingsCard(
            title: 'Languages',
          ),
        );
      },
    ),);
  }
}
