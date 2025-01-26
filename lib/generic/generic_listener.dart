import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/exception/error.dart';
import 'base_state.dart';

class GenericBlocListener<C extends Cubit<BaseState>, T> extends StatelessWidget {
  final Widget child;
  final Function(BuildContext context, T data)? onSuccess;
  final Function(BuildContext context, ErrorMessage errorMessage)? onFailure;

  const GenericBlocListener({
    super.key,
    required this.child,
    this.onSuccess,
    this.onFailure,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<C, BaseState>(
      listener: (context, state) {
        if (state is SuccessState<T> && onSuccess != null) {
          onSuccess!(context, state.data);
        } else if (state is FailureState && onFailure != null) {
          onFailure!(context, state.errorMessage);
        }
      },
      child: child,
    );
  }
}
