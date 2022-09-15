import 'package:free_api_weather_app/core/services/http_client.dart';
import 'package:free_api_weather_app/core/services/shared_preferences_service.dart';
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

void _setupRepositories() {}

void _setupBlocs() {}
