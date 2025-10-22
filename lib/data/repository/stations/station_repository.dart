import 'package:mobile/data/data_provider/station_provider.dart';
import 'package:mobile/model/station_model.dart';

class StationRepository {
  final StationProvider _stationProvider;

  StationRepository(this._stationProvider);

  Future<List<StationModel>> getStations() async {
    try {
      final stations = await _stationProvider.loadStations();
      return stations;
    } catch (error) {
      throw Exception('Failed to fetch stations');
    }
  }
}
