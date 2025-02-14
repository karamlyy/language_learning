import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/app/app_cubit.dart';
import 'package:language_learning/app/app_state.dart';
import 'package:language_learning/presenter/screens/auth/languages/view/set_language_page.dart';
import 'package:language_learning/presenter/screens/auth/login/view/login_page.dart';
import 'package:language_learning/presenter/screens/auth/onboarding/view/onboarding_page.dart';
import 'package:language_learning/presenter/screens/auth/timing/view/timing_page.dart';
import 'package:language_learning/presenter/screens/home/view/home_page.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:language_learning/utils/routes/navigation.dart';
import 'package:language_learning/utils/routes/route_generator.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 852),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'DMSans',
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.appBarBackground,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              },
            ),
          ),
          debugShowCheckedModeBanner: false,
          navigatorKey: Navigation.navigatorKey,
          onGenerateRoute: generateRoute,
          home: MultiProvider(
            providers: [
              BlocProvider(create: (_) => AppCubit()),
            ],
            child: BlocConsumer<AppCubit, AppState>(
              builder: (context, state) {
                if (state is Onboarding) {
                  return const OnboardingPage();
                } else if (state is Unauthorized) {
                  return const LoginPage();
                } else if (state is LanguageNeeded) {
                  return const SetLanguagePage();
                } else if (state is TimingNeeded) {
                  return const TimingPage();
                } else if (state is Authorized) {
                  return const HomePage();
                }
                return const LoginPage();
              },
              listener: (context, state) {},
            ),
          ),
        );
      },
    );
  }
}
