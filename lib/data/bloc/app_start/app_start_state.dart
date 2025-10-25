import 'package:equatable/equatable.dart';

abstract class AppStartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppStartInitial extends AppStartState {}

class AppStartLoading extends AppStartState {}

class FirstTimeUser extends AppStartState {}

class ReturningUser extends AppStartState {}

class AppStartError extends AppStartState {}
