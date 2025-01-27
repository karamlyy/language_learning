import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/presenter/screens/settings/view/setting_header_text.dart';
import 'package:language_learning/presenter/widgets/settings_card.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0).r,
        child: Column(
          children: [
            SettingHeaderText(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Column(
                    children: [
                      Text('salam11'),
                      Text('sagol22'),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
