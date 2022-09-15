import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

String localWeatherKey = 'localWeatherKey';

class SharedPreferencesService {
  final StreamController<String> _keys$ = StreamController.broadcast();

  Stream<String?> onChange$(String key) async* {
    final instance = await SharedPreferences.getInstance();
    _keys$.stream.where((s) => key == s).map((key) => instance.getString(key));
  }

  Future<String?> getString(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString(key);
  }

  Future setString(String key, String value) async {
    final instance = await SharedPreferences.getInstance();
    return instance.setString(key, value).then((_) => _keys$.add(key));
  }

  Future<bool?> getBool(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.getBool(key);
  }

  Future setBool(String key, bool value) async {
    final instance = await SharedPreferences.getInstance();
    return instance.setBool(key, value).then((_) => _keys$.add(key));
  }

  Future<void> remove(String key) async {
    final instance = await SharedPreferences.getInstance();
    return instance.remove(key).then((_) => _keys$.add(key));
  }

  Future clear() async {
    final instance = await SharedPreferences.getInstance();

    print('SharedPreferencesService.clear before: ${instance.getKeys()}');
    return instance.clear().then((_) => print(
          'SharedPreferencesService.clear after: ${instance.getKeys()}',
        ));
  }
}
