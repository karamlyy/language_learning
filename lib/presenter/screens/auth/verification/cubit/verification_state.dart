import 'package:equatable/equatable.dart';
import 'package:language_learning/data/exception/error.dart';

class VerificationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerificationInitial extends VerificationState {}

class VerificationLoading extends VerificationState {}


class VerificationFailure extends VerificationState {
  final ErrorMessage errorMessage;

  VerificationFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}