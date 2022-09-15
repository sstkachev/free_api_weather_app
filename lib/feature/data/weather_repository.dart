import 'package:free_api_weather_app/core/services/http_client.dart';
import 'package:free_api_weather_app/core/services/shared_preferences_service.dart';

class WeatherRepository {
  final HttpClientService httpClient;
  final SharedPreferencesService sharedPreferencesService;

  WeatherRepository({
    required this.sharedPreferencesService,
    required this.httpClient,
  });
}
