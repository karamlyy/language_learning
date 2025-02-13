import 'package:flutter/material.dart';
import 'package:language_learning/data/model/auth/forgot_password_model.dart';
import 'package:language_learning/data/model/auth/register_model.dart';
import 'package:language_learning/data/model/home/category_word_model.dart';
import 'package:language_learning/presenter/screens/add-language-pair/view/add_language_pair_page.dart';
import 'package:language_learning/presenter/screens/auth/forgot-password/view/forgot_password_page.dart';
import 'package:language_learning/presenter/screens/auth/languages/view/set_language_page.dart';
import 'package:language_learning/presenter/screens/auth/login/view/login_page.dart';
import 'package:language_learning/presenter/screens/auth/onboarding/view/onboarding_page.dart';
import 'package:language_learning/presenter/screens/auth/register/view/register_page.dart';
import 'package:language_learning/presenter/screens/auth/reset-password/view/password_changed_page.dart';
import 'package:language_learning/presenter/screens/auth/reset-password/view/reset_password_page.dart';
import 'package:language_learning/presenter/screens/auth/splash/view/splash_page.dart';
import 'package:language_learning/presenter/screens/auth/timing/view/timing_page.dart';
import 'package:language_learning/presenter/screens/auth/verification/view/verification_page.dart';
import 'package:language_learning/presenter/screens/auth/verify-code/view/verify_code_page.dart';
import 'package:language_learning/presenter/screens/change-password/view/change_password_page.dart';
import 'package:language_learning/presenter/screens/create-language-pair/view/create_language_pair_page.dart';
import 'package:language_learning/presenter/screens/home/view/home_page.dart';
import 'package:language_learning/presenter/screens/learning-vocabulary/view/learning_vocabulary_page.dart';
import 'package:language_learning/presenter/screens/new-word/view/new_word_page.dart';
import 'package:language_learning/presenter/screens/quiz/view/quiz_page.dart';
import 'package:language_learning/presenter/screens/settings/view/settings_page.dart';
import 'package:language_learning/presenter/screens/timing/view/change_timing_page.dart';
import 'package:language_learning/presenter/screens/vocabulary/view/vocabulary_page.dart';
import 'package:language_learning/presenter/screens/word-list/view/word_list_page.dart';
import 'package:language_learning/utils/routes/app_routes.dart';

Route<dynamic> createPageRoute(Widget page, [RouteSettings? settings]) {
  return MaterialPageRoute(
    builder: (_) => page,
    settings: settings,
  );
}

Route<dynamic> generateRoute(RouteSettings settings) {
  final routeName = Routes.fromString(settings.name);
  switch (routeName) {
    case Routes.splash:
      return createPageRoute(const SplashPage(), settings);
    case Routes.onboarding:
      return createPageRoute(const OnboardingPage(), settings);
    case Routes.login:
      return createPageRoute(const LoginPage(), settings);
    case Routes.register:
      return createPageRoute(const RegisterPage(), settings);
    case Routes.verification:
      return createPageRoute(
        VerificationPage(
          registerModel: settings.arguments as RegisterModel,
        ),
        settings,
      );
    case Routes.verifyCode:
      return createPageRoute(
        VerifyCodePage(
          forgotPasswordModel: settings.arguments as ForgotPasswordModel,
        ),
        settings,
      );
    case Routes.forgotPassword:
      return createPageRoute(const ForgotPasswordPage(), settings);
    case Routes.resetPassword:
      return createPageRoute(
          ResetPasswordPage(
            forgotPasswordModel: settings.arguments as ForgotPasswordModel,
          ),
          settings);
    case Routes.passwordChanged:
      return createPageRoute(const PasswordChangedPage(), settings);
    case Routes.setLanguage:
      return createPageRoute(const SetLanguagePage(), settings);

    case Routes.setTiming:
      return createPageRoute(const TimingPage(), settings);
    case Routes.home:
      return createPageRoute(const HomePage(), settings);
    case Routes.quiz:
      return createPageRoute(const QuizPage(), settings);
    case Routes.wordList:
      return createPageRoute(
          WordListPage(
            categoryWords: settings.arguments as List<CategoryWordModel>,
          ),
          settings);
    case Routes.vocabulary:
      return createPageRoute(const VocabularyPage(), settings);
    case Routes.learningVocabulary:
      return createPageRoute(const LearningVocabularyPage(), settings);
    case Routes.newWord:
      return createPageRoute(const NewWordPage(), settings);
    case Routes.settings:
      return createPageRoute(const SettingsPage(), settings);
    case Routes.changePassword:
      return createPageRoute(const ChangePasswordPage(), settings);
    case Routes.changeTiming:
      return createPageRoute(const ChangeTimingPage(), settings);
    case Routes.addLanguagePair:
      return createPageRoute(const AddLanguagePairPage(), settings);
    case Routes.createLanguagePair:
      return createPageRoute(const CreateLanguagePairPage(), settings);
    default:
      return createPageRoute(
        const Scaffold(
          body: Center(child: Text('tapilmadi')),
        ),
        settings,
      );
  }
}
