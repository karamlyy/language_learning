import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Splash extends AppState {}

class Onboarding extends AppState {}

class Unauthorized extends AppState {}

class VerificationNeeded extends AppState {}

class Authorized extends AppState {}
