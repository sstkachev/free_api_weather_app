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
          return Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Город'),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Последний запрос'),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  if (state.isLocalLoading) const CircularProgressIndicator(),
                  state.localResponse != null
                      ? LocalWeatherInfoWidget()
                      : const Text('...'),
                  const SizedBox(
                    height: 32,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Узнать погоду'),
                  ),
                  const SizedBox(height: 32),
                  if (state.isRemoteLoading)
                    const CircularProgressIndicator()
                  else
                    state.remoteResponse != null
                        ? WeatherInfoWidget()
                        : const Text('ОШИБКА'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LocalWeatherInfoWidget extends StatelessWidget {
  const LocalWeatherInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
