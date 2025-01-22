import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/presenter/screens/auth/register/cubit/register_cubit.dart';
import 'package:language_learning/presenter/screens/auth/register/cubit/register_state.dart';
import 'package:language_learning/presenter/screens/auth/register/provider/register_provider.dart';
import 'package:language_learning/presenter/screens/auth/register/view/register_body.dart';
import 'package:language_learning/presenter/widgets/primary_bottom_sheet.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
          child: BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                print("Successful registration");
              } else if (state is RegisterFailure) {
                PrimaryBottomSheet.show(context,
                    text: state.errorMessage.message);
              }
            },
            child: const RegisterBody(),
          ),
        ),
      ),
    );
  }
}
