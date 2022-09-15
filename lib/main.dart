import 'package:flutter/material.dart';
import 'package:free_api_weather_app/feature/presentation/weather_screen/weather_screen.dart';

import 'core/locator.dart';

void main() {
  runApp(
    FutureBuilder(
      future: setupLocator(),
      builder: (context, snapshot) {
        return const MyHomePage();
      },
    ),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherScreen(),
    );
  }
}
