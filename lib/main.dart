import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/data/bloc/app_start/app_start_bloc.dart';
import 'package:mobile/data/bloc/app_start/app_start_event.dart';
import 'package:mobile/data/bloc/app_start/app_start_state.dart';
import 'package:mobile/data/bloc/biometric/biometric_cubit.dart';
import 'package:mobile/data/bloc/stations/station_bloc.dart';
import 'package:mobile/data/data_provider/station_provider.dart';
import 'package:mobile/data/repository/stations/station_repository.dart';
import 'package:mobile/screens/account/login.dart';
import 'package:mobile/screens/account/signup.dart';
import 'package:mobile/screens/custom_navigation.dart';
import 'package:mobile/screens/forgotten_password/forgotten_password.dart';
import 'package:mobile/screens/forgotten_password/set_new_password.dart';
import 'package:mobile/screens/forgotten_password/verify_code.dart';
import 'package:mobile/screens/home/home.dart';
import 'package:mobile/screens/notification/notification_screen.dart';
import 'package:mobile/screens/order/order.dart';
import 'package:mobile/screens/pre_order/pre_order.dart';
import 'package:mobile/screens/search/search.dart';
import 'package:mobile/screens/settings/settings.dart';
import 'package:mobile/screens/splash/splash.dart';
import 'package:mobile/screens/wallet/wallet.dart';
import 'package:mobile/widget/loading_screen.dart';

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
          BlocProvider(
            create: (_) => AppStartBloc()..add(CheckFirstTimeEvent()),
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
    return MaterialApp(
      theme: theme,
      home: BlocBuilder<AppStartBloc, AppStartState>(
        builder: (ctx, state) {
          if (state is AppStartLoading) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (state is FirstTimeUser) {
            return Splash();
          }
          if (state is ReturningUser) {
            return Login();
          } else {
            return const Scaffold(
              body: Center(child: Text('Something went wrong')),
            );
          }
        },
      ),
    );
  }
}
