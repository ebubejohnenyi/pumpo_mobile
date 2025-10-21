import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: Login());
  }
}
