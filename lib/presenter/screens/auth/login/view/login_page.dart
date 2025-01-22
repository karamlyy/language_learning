import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/presenter/screens/auth/login/cubit/login_cubit.dart';
import 'package:language_learning/presenter/screens/auth/login/cubit/login_state.dart';
import 'package:language_learning/presenter/screens/auth/login/provider/login_provider.dart';
import 'package:language_learning/presenter/screens/auth/login/view/login_body.dart';
import 'package:language_learning/presenter/widgets/primary_bottom_sheet.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => LoginProvider(),
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                print("Successful login");
              } else if (state is LoginFailure) {
                PrimaryBottomSheet.show(context,
                    text: state.errorMessage.message);
              }
            },
            child: const LoginBody(),
          ),
        ),
      ),
    );
  }
}
