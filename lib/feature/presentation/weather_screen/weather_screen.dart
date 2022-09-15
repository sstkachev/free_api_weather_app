import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_api_weather_app/core/locator.dart';
import 'package:free_api_weather_app/feature/presentation/weather_screen/weather_cubit.dart';
import 'package:free_api_weather_app/feature/presentation/weather_screen/weather_state.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WeatherApp'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        bloc: locator.get<WeatherCubit>(),
        builder: (context, state) {
          return const Center(
            child: Text('Weather'),
          );
        },
      ),
    );
  }
}
