import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/model/auth/login_model.dart';import 'package:language_learning/generic/generic_listener.dart';
import 'package:language_learning/presenter/screens/auth/login/cubit/login_cubit.dart';
import 'package:language_learning/presenter/screens/auth/login/provider/login_provider.dart';
import 'package:language_learning/presenter/screens/auth/login/view/login_body.dart';
import 'package:language_learning/presenter/widgets/primary_bottom_sheet.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LoginCubit(),
          child: GenericBlocListener<LoginCubit, LoginModel>(
            onSuccess: (context, data) {
              print("Successful login");
            },
            onFailure: (context, errorMessage) {
              PrimaryBottomSheet.show(context, text: errorMessage.message);
            },
            child: const LoginBody(),
          ),
        ),
      ),
    );
  }
}
