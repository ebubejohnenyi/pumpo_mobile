import 'package:equatable/equatable.dart';

abstract class AppStartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckFirstTimeEvent extends AppStartEvent {}
