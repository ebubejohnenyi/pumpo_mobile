import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/bloc/biometric/biometric_cubit.dart';
import 'package:mobile/data/bloc/stations/station_bloc.dart';
import 'package:mobile/data/data_provider/station_provider.dart';
import 'package:mobile/data/repository/stations/station_repository.dart';
import 'package:mobile/screens/account/login.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Colors.black,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontFamily: 'Montserrat'),
    titleMedium: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
    titleSmall: TextStyle(
      fontSize: 10.0,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    ),
  ),
);

void main() {
  final stationProvider = StationProvider();
  final stationRepository = StationRepository(stationProvider);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => BiometricCubit()),
          BlocProvider(
            create: (_) => StationBloc(stationRepository)..add(LoadStations()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: Login());
  }
}
