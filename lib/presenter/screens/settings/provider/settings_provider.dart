import 'package:flutter/cupertino.dart';
import 'package:language_learning/presenter/widgets/settings_card.dart';

class SettingsProvider extends ChangeNotifier {
  final List<SettingsCard> _settings = [
    SettingsCard(
      title: 'Languages',
      leadingIcon: Icon(CupertinoIcons.globe),
    ),
    SettingsCard(
      title: 'Timing',
      leadingIcon: Icon(CupertinoIcons.clock),
    ),
    SettingsCard(
      title: 'Password',
      leadingIcon: Icon(CupertinoIcons.lock_fill),
    ),
    SettingsCard(
      title: 'Terms and Conditions',
      leadingIcon: Icon(CupertinoIcons.book),
      trailingIcon: Icon(CupertinoIcons.arrow_down_left),
    ),


  ];

  List<SettingsCard> get settings => _settings;
}
