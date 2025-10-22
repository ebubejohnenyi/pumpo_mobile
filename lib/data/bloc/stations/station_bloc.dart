import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/repository/stations/station_repository.dart';

import '../../../model/station_model.dart';

part 'station_state.dart';
part 'stations_event.dart';

class StationBloc extends Bloc<StationEvent, StationState> {
  final StationRepository _repository;

  StationBloc(this._repository) : super(StationLoading()) {
    on<LoadStations>((event, emit) async {
      emit(StationLoading());

      try {
        final stations = await _repository.getStations();
        emit(StationLoaded(stations));
      } catch (e) {
        emit(StationError(e.toString()));
      }
    });
  }
}
