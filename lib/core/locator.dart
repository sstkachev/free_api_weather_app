import 'package:free_api_weather_app/core/services/http_client.dart';
import 'package:free_api_weather_app/core/services/shared_preferences_service.dart';
import 'package:free_api_weather_app/feature/data/weather_repository.dart';
import 'package:free_api_weather_app/feature/presentation/weather_screen/weather_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;
bool isLocatorInitialized = false;

Future setupLocator() async {
  await locator.reset();
  _setupServices();
  _setupRepositories();
  _setupBlocs();
  isLocatorInitialized = true;
  return isLocatorInitialized;
}

void _setupServices() {
  locator.registerSingleton(HttpClientService());
  locator.registerSingleton(SharedPreferencesService());
}

void _setupRepositories() {
  locator.registerSingleton(
    WeatherRepository(
      sharedPreferencesService: locator.get(),
      httpClient: locator.get(),
    ),
  );
}

void _setupBlocs() {
  locator.registerSingleton(WeatherCubit(
    weatherRepository: locator.get(),
  ));
}
