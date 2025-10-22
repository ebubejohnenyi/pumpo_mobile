import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/model/station_model.dart';

class StationProvider {
  final baseUrl = Uri.https(
    'shopping-demo-5e6be-default-rtdb.firebaseio.com',
    'stations.json',
  );

  Future<List<StationModel>> loadStations() async {
    final response = await http.get(baseUrl);

    if (response.body == 'null') {
      return [];
    }
    final List<StationModel> stations = [];

    final Map<String, dynamic> listData = json.decode(response.body);

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
