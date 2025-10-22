part of 'station_bloc.dart';

abstract class StationState {}

class StationLoading extends StationState {}

class StationLoaded extends StationState {
  final List<StationModel> stations;
  StationLoaded(this.stations);
}

class StationError extends StationState {
  final String message;
  StationError(this.message);
}
