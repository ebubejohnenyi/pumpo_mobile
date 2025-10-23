import 'package:mobile/model/station_model.dart';
import 'package:dio/dio.dart';

class StationProvider {
  final dio = Dio();

  Future<List<StationModel>> loadStations() async {
    Response response;
    response = await dio.get(
      'https://shopping-demo-5e6be-default-rtdb.firebaseio.com/stations.json',
    );

    if (response.data == null) {
      return [];
    }

    final List<StationModel> stations = [];

    final Map<String, dynamic> listData = response.data;

    for (final station in listData.entries) {
      stations.add(
        StationModel(
          id: station.key,
          name: station.value['name'],
          logo: station.value['logo'],
          distance: station.value['distance'],
          status: station.value['status'],
          petrolPrice: station.value['petrol-price'],
          gasPrice: station.value['gas-price'],
          dieselPrice: station.value['diesel-price'],
          stationAddress: station.value['station-address'],
          userAddress: station.value['user-address'],
        ),
      );
    }
    return stations;
  }
}
