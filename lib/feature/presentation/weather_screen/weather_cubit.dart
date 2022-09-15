import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_api_weather_app/feature/data/weather_repository.dart';
import 'package:free_api_weather_app/feature/presentation/weather_screen/weather_state.dart';
import 'package:translator/translator.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  final cityTextController = TextEditingController();
  final translator = GoogleTranslator();

  WeatherCubit({required this.weatherRepository})
      : super(
          const WeatherState.initial(),
        );

  void onTapRemote() {
    emit(state.copyWith(isRemoteLoading: true));
    translator
        .translate(cityTextController.text, to: 'en')
        .then((city) => weatherRepository.getRemoteWeather(city: '$city'))
        .then((value) => emit(state.copyWith(remoteResponse: value)))
        .whenComplete(() => emit(state.copyWith(isRemoteLoading: false)));
  }

  void onTapLocal() {
    emit(state.copyWith(isLocalLoading: true));
    weatherRepository
        .getLocalWeather()
        .then((value) => emit(state.copyWith(localResponse: value)))
        .whenComplete(() => emit(state.copyWith(isLocalLoading: false)));
  }
}
