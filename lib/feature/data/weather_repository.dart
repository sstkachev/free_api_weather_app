import 'dart:convert';

import 'package:free_api_weather_app/core/services/http_client.dart';
import 'package:free_api_weather_app/core/services/shared_preferences_service.dart';

import '../../core/models/weather_dto.dart';

class WeatherRepository {
  final HttpClientService httpClient;
  final SharedPreferencesService sharedPreferencesService;

  WeatherRepository({
    required this.sharedPreferencesService,
    required this.httpClient,
  });

  Future<WeatherDto?> getLocalWeather() {
    return sharedPreferencesService
        .getString(localWeatherKey)
        .then((value) => jsonDecode(value!))
        .then((map) => WeatherDto.fromJson(map));
  }

  Future<WeatherDto?> getRemoteWeather({required String city}) async {
    return httpClient
        .executeGet(
            'https://api.openweathermap.org/data/2.5/weather?appid=e4770339f149e1ba2abeaccab77be214&q=$city&units=metric')
        .then((response) async {
      await sharedPreferencesService.setString(
          localWeatherKey, jsonEncode(response.data));
      return response.data;
    }).then((map) => WeatherDto.fromJson(map));
  }
}
