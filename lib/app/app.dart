import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:language_learning/app/app_cubit.dart';
import 'package:language_learning/app/app_state.dart';
import 'package:language_learning/presenter/screens/auth/login/view/login_page.dart';
import 'package:language_learning/presenter/screens/auth/onboarding/view/onboarding_page.dart';
import 'package:language_learning/presenter/screens/home/view/home_page.dart';
import 'package:language_learning/utils/colors/app_colors.dart';
import 'package:language_learning/utils/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../utils/routes/navigation.dart';
import '../utils/routes/route_generator.dart';

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
          initialRoute: Routes.onboarding.path,
          onGenerateRoute: generateRoute,
          home: MultiProvider(
            providers: [BlocProvider(create: (_) => AppCubit())],
            child: BlocConsumer<AppCubit, AppState>(
              builder: (BuildContext context, AppState state) {
                if (state is Authorized) {
                  return const HomePage();
                }
                if (state is UnAuthorized) {
                  return const LoginPage();
                }
                return const OnboardingPage();
              },
              listener: (BuildContext context, AppState state) {},
            ),
          ),
        );
      },
    );
  }
}