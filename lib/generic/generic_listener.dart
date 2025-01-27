import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:language_learning/data/exception/error.dart';
import 'package:language_learning/generic/base_state.dart';
import 'package:language_learning/presenter/widgets/primary_bottom_sheet.dart';

class GenericBlocListener<C extends Cubit<BaseState>, T>
    extends StatelessWidget {
  final Widget child;
  final Function(BuildContext context, ErrorMessage errorMessage)? onFailure;

  const GenericBlocListener({
    super.key,
    required this.child,
    this.onFailure,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<C, BaseState>(
      listener: (context, state) {
        if (state is FailureState && onFailure != null) {
          PrimaryBottomSheet.show(
            onFailure!(
              context,
              state.errorMessage,
            ),
          );
        }
      },
      child: child,
    );
  }
}
