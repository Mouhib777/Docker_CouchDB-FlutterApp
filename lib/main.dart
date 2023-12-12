import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/login.dart';
import 'package:flutter_application_3/screens/splash.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color myColor = Colors.red;

    MaterialColor myThemeColor = MaterialColor(
      myColor.value,
      <int, Color>{
        50: myColor.withOpacity(0.1),
        100: myColor.withOpacity(0.2),
        200: myColor.withOpacity(0.3),
        300: myColor.withOpacity(0.4),
        400: myColor.withOpacity(0.5),
        500: myColor.withOpacity(0.6),
        600: myColor.withOpacity(0.7),
        700: myColor.withOpacity(0.8),
        800: myColor.withOpacity(0.9),
        900: myColor.withOpacity(1.0),
      },
    );
    ThemeData myTheme = ThemeData(
      primarySwatch: myThemeColor,
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        title: 'CouchDB',
        theme: myTheme,
        home: splashScreen());
  }
}
