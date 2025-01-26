import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/exception/error.dart';
import 'base_state.dart';

class GenericBlocBuilder<C extends Cubit<BaseState>, T>
    extends StatelessWidget {
  final Widget Function(BuildContext context)? onInitial;
  final Widget Function(BuildContext context)? onLoading;
  final Widget Function(BuildContext context, T? data)? onSuccess;
  final Widget Function(BuildContext context, ErrorMessage errorMessage)?
      onFailure;

  const GenericBlocBuilder({
    super.key,
    this.onInitial,
    this.onLoading,
    this.onSuccess,
    this.onFailure,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, BaseState>(
      builder: (context, state) {
        if (state is InitialState) {
          return onInitial != null
              ? onInitial!(context)
              : const SizedBox.shrink();
        } else if (state is LoadingState) {
          return onLoading != null
              ? onLoading!(context)
              : const CircularProgressIndicator();
        } else if (state is SuccessState<T>) {
          return onSuccess != null
              ? onSuccess!(context, state.data)
              : const SizedBox.shrink();
        } else if (state is FailureState) {
          return onFailure != null
              ? onFailure!(context, state.errorMessage)
              : const SizedBox.shrink();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
