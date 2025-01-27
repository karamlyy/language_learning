import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/generic/base_state.dart';

class BaseBuilder<C extends StateStreamable<S>, S> extends BlocBuilder<C, S> {
  const BaseBuilder({
    super.key,
    required BlocWidgetBuilder<S> builder,
    BlocBuilderCondition<S>? buildWhen,
  }) : super(
          builder: builder,
          buildWhen: buildWhen,
        );

  @override
  Widget build(BuildContext context, S state) {
    if (state is LoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    return super.build(context, state);
  }
}
