import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_learning/app/app.dart';
import 'package:language_learning/data/service/api/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Injector.register();

  runApp(const App());
}
