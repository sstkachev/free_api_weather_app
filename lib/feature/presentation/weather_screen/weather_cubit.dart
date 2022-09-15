import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_api_weather_app/feature/data/weather_repository.dart';
import 'package:free_api_weather_app/feature/presentation/weather_screen/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository}) : super (const WeatherState.initial());
}